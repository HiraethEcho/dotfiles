import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Widgets

Item {
  id: root
  property var pluginApi: null

  // Settings
  property var cfg: pluginApi?.pluginSettings || ({})
  property var defaults: pluginApi?.manifest?.metadata?.defaultSettings || ({})

  // Settings values
  property int settingsWidth: cfg.windowWidth ?? defaults.windowWidth ?? 1400
  property int settingsHeight: cfg.windowHeight ?? defaults.windowHeight ?? 0
  property bool autoHeight: cfg.autoHeight ?? defaults.autoHeight ?? true
  property int columnCount: cfg.columnCount ?? defaults.columnCount ?? 3
  property string hyprlandConfigPath: cfg.hyprlandConfigPath || defaults.hyprlandConfigPath || "~/.config/hypr/hyprland.conf"
  property string niriConfigPath: cfg.niriConfigPath || defaults.niriConfigPath || "~/.config/niri/config.kdl"

  property var rawCategories: pluginApi?.pluginSettings?.cheatsheetData || []
  property var categories: processCategories(rawCategories)
  property string compositor: pluginApi?.pluginSettings?.detectedCompositor || ""

  // Dynamic column items (up to 4 columns)
  property var columnItems: []

  onRawCategoriesChanged: {
    categories = processCategories(rawCategories);
    updateColumnItems();
    // Hide error view when data is loaded
    if (rawCategories.length > 0) {
      errorView.visible = false;
    }
  }

  onCategoriesChanged: {
    updateColumnItems();
    contentPreferredHeight = calculateDynamicHeight();
  }

  onColumnCountChanged: {
    updateColumnItems();
    contentPreferredHeight = calculateDynamicHeight();
  }

  function updateColumnItems() {
    var assignments = distributeCategories();
    var items = [];
    for (var i = 0; i < columnCount; i++) {
      items.push(buildColumnItems(assignments[i] || []));
    }
    columnItems = items;
  }

  property real contentPreferredWidth: settingsWidth
  property real contentPreferredHeight: calculateDynamicHeight()
  readonly property var geometryPlaceholder: panelContainer
  readonly property bool allowAttach: false
  readonly property bool panelAnchorHorizontalCenter: true
  readonly property bool panelAnchorVerticalCenter: true
  anchors.fill: parent
  property var allLines: []
  property bool isLoading: false

  function calculateDynamicHeight() {
    // If auto height is disabled, use manual height
    if (!autoHeight && settingsHeight > 0) {
      return settingsHeight;
    }

    if (categories.length === 0) return 400;

    var assignments = distributeCategories();
    var maxColumnHeight = 0;

    for (var col = 0; col < columnCount; col++) {
      var colHeight = 0;
      var catIndices = assignments[col] || [];

      for (var i = 0; i < catIndices.length; i++) {
        var catIndex = catIndices[i];
        if (catIndex >= categories.length) continue;

        var cat = categories[catIndex];
        colHeight += 26; // Header
        colHeight += cat.binds.length * 20; // Binds
        if (i < catIndices.length - 1) {
          colHeight += 6; // Spacer
        }
      }

      if (colHeight > maxColumnHeight) {
        maxColumnHeight = colHeight;
      }
    }

    // header (45) + content + margins (16)
    var totalHeight = 45 + maxColumnHeight + 16;
    return Math.max(300, Math.min(totalHeight, 1200));
  }

  // Flag to prevent re-parsing when settings are still loading
  property bool settingsReady: false

  onPluginApiChanged: {
    if (pluginApi) {
      // Small delay to allow settings to load properly after boot
      settingsLoadTimer.restart();
    }
  }

  Component.onCompleted: {
    if (pluginApi) {
      settingsLoadTimer.restart();
    }
  }

  Timer {
    id: settingsLoadTimer
    interval: 100  // 100ms delay to allow settings to load
    repeat: false
    onTriggered: {
      root.settingsReady = true;
      checkAndGenerate();
    }
  }

  function detectCompositor() {
    var hyprlandSig = Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE");
    var niriSocket = Quickshell.env("NIRI_SOCKET");

    if (hyprlandSig && hyprlandSig.length > 0) {
      compositor = "hyprland";
    } else if (niriSocket && niriSocket.length > 0) {
      compositor = "niri";
    } else {
      // Fallback detection via process
      detectProcess.running = true;
      return false;
    }

    if (pluginApi) {
      pluginApi.pluginSettings.detectedCompositor = compositor;
      pluginApi.saveSettings();
    }
    return true;
  }

  Process {
    id: detectProcess
    command: ["sh", "-c", "pgrep -x hyprland >/dev/null && echo hyprland || (pgrep -x niri >/dev/null && echo niri || echo unknown)"]
    running: false

    stdout: SplitParser {
      onRead: data => {
        root.compositor = data.trim();
        if (pluginApi && root.compositor !== "unknown") {
          pluginApi.pluginSettings.detectedCompositor = root.compositor;
          pluginApi.saveSettings();
        }
        if (root.compositor !== "unknown") {
          startParsing();
        } else {
          root.isLoading = false;
          errorText.text = "No supported compositor detected";
          errorView.visible = true;
        }
      }
    }
  }

  function checkAndGenerate() {
    // Check if settings are ready and we actually need to generate
    if (!settingsReady) return;

    // Get the actual cheatsheetData from settings
    var savedData = pluginApi?.pluginSettings?.cheatsheetData;

    // Check if data exists and is a non-empty array
    var hasData = Array.isArray(savedData) && savedData.length > 0;

    if (!hasData) {
      isLoading = true;
      allLines = [];

      if (!compositor) {
        if (!detectCompositor()) {
          return; // Wait for process detection
        }
      }
      startParsing();
    }
  }

  function startParsing() {
    if (compositor === "hyprland") {
      hyprlandProcess.running = true;
    } else if (compositor === "niri") {
      niriProcess.running = true;
    }
  }

  // Hyprland config reader
  Process {
    id: hyprlandProcess
    command: ["sh", "-c", "cat " + root.hyprlandConfigPath.replace("~", "$HOME")]
    running: false

    stdout: SplitParser {
      onRead: data => { root.allLines.push(data); }
    }

    onExited: (exitCode, exitStatus) => {
      isLoading = false;
      if (exitCode === 0 && root.allLines.length > 0) {
        var fullContent = root.allLines.join("\n");
        parseHyprlandConfig(fullContent);
        root.allLines = [];
      } else {
        errorText.text = pluginApi?.tr("keybind-cheatsheet.panel.error-read-file") || ("Cannot read " + root.hyprlandConfigPath);
        errorView.visible = true;
      }
    }
  }

  // Niri config reader
  Process {
    id: niriProcess
    command: ["sh", "-c", "cat " + root.niriConfigPath.replace("~", "$HOME")]
    running: false

    stdout: SplitParser {
      onRead: data => { root.allLines.push(data); }
    }

    onExited: (exitCode, exitStatus) => {
      isLoading = false;
      if (exitCode === 0 && root.allLines.length > 0) {
        var fullContent = root.allLines.join("\n");
        parseNiriConfig(fullContent);
        root.allLines = [];
      } else {
        errorText.text = pluginApi?.tr("keybind-cheatsheet.panel.error-read-file") || ("Cannot read " + root.niriConfigPath);
        errorView.visible = true;
      }
    }
  }

  // ========== SHARED KEY FORMATTING ==========
  function formatSpecialKey(key) {
    var keyMap = {
      // Audio keys (mixed case for Niri)
      "XF86AudioRaiseVolume": "Vol +",
      "XF86AudioLowerVolume": "Vol -",
      "XF86AudioMute": "Mute",
      "XF86AudioMicMute": "Mic Mute",
      "XF86AudioPlay": "Play",
      "XF86AudioPause": "Pause",
      "XF86AudioNext": "Next",
      "XF86AudioPrev": "Prev",
      "XF86AudioStop": "Stop",
      "XF86AudioMedia": "Media",
      // Audio keys (uppercase for Hyprland)
      "XF86AUDIORAISEVOLUME": "Vol +",
      "XF86AUDIOLOWERVOLUME": "Vol -",
      "XF86AUDIOMUTE": "Mute",
      "XF86AUDIOMICMUTE": "Mic Mute",
      "XF86AUDIOPLAY": "Play",
      "XF86AUDIOPAUSE": "Pause",
      "XF86AUDIONEXT": "Next",
      "XF86AUDIOPREV": "Prev",
      "XF86AUDIOSTOP": "Stop",
      "XF86AUDIOMEDIA": "Media",
      // Brightness keys (mixed case)
      "XF86MonBrightnessUp": "Bright +",
      "XF86MonBrightnessDown": "Bright -",
      // Brightness keys (uppercase)
      "XF86MONBRIGHTNESSUP": "Bright +",
      "XF86MONBRIGHTNESSDOWN": "Bright -",
      // Other common keys (mixed case)
      "XF86Calculator": "Calc",
      "XF86Mail": "Mail",
      "XF86Search": "Search",
      "XF86Explorer": "Files",
      "XF86WWW": "Browser",
      "XF86HomePage": "Home",
      "XF86Favorites": "Favorites",
      "XF86PowerOff": "Power",
      "XF86Sleep": "Sleep",
      "XF86Eject": "Eject",
      // Other common keys (uppercase)
      "XF86CALCULATOR": "Calc",
      "XF86MAIL": "Mail",
      "XF86SEARCH": "Search",
      "XF86EXPLORER": "Files",
      "XF86WWW": "Browser",
      "XF86HOMEPAGE": "Home",
      "XF86FAVORITES": "Favorites",
      "XF86POWEROFF": "Power",
      "XF86SLEEP": "Sleep",
      "XF86EJECT": "Eject",
      // Print screen
      "Print": "PrtSc",
      "PRINT": "PrtSc",
      // Navigation
      "Prior": "PgUp",
      "Next": "PgDn",
      "PRIOR": "PgUp",
      "NEXT": "PgDn",
      // Mouse (for Hyprland)
      "MOUSE_DOWN": "Scroll Down",
      "MOUSE_UP": "Scroll Up",
      "MOUSE:272": "Left Click",
      "MOUSE:273": "Right Click",
      "MOUSE:274": "Middle Click"
    };
    return keyMap[key] || key;
  }

  // ========== HYPRLAND PARSER ==========
  function parseHyprlandConfig(text) {
    var lines = text.split('\n');
    var cats = [];
    var currentCat = null;

    for (var i = 0; i < lines.length; i++) {
      var line = lines[i].trim();
      if (line.startsWith("#") && line.match(/#\s*\d+\./)) {
        if (currentCat) cats.push(currentCat);
        var title = line.replace(/#\s*\d+\.\s*/, "").trim();
        currentCat = { "title": title, "binds": [] };
      }
      else if (line.includes("bind") && line.includes('#"')) {
        if (currentCat) {
          var descMatch = line.match(/#"(.*?)"$/);
          var desc = descMatch ? descMatch[1] : (pluginApi?.tr("keybind-cheatsheet.panel.no-description") || "No description");
          var parts = line.split(',');
          if (parts.length >= 2) {
            var bindPart = parts[0].trim();
            var keyPart = parts[1].trim();
            var mod = "";
            if (bindPart.includes("$mod")) mod = "Super";
            if (bindPart.includes("SHIFT")) mod += (mod ? " + Shift" : "Shift");
            if (bindPart.includes("CTRL")) mod += (mod ? " + Ctrl" : "Ctrl");
            if (bindPart.includes("ALT")) mod += (mod ? " + Alt" : "Alt");
            var key = formatSpecialKey(keyPart.toUpperCase());
            var fullKey = mod + (mod && key ? " + " : "") + key;
            currentCat.binds.push({ "keys": fullKey, "desc": desc });
          }
        }
      }
    }
    if (currentCat) cats.push(currentCat);
    if (cats.length > 0) {
      pluginApi.pluginSettings.cheatsheetData = cats;
      pluginApi.saveSettings();
    } else {
      errorText.text = pluginApi?.tr("keybind-cheatsheet.panel.no-categories") || "No keybindings found";
      errorView.visible = true;
    }
  }

  // ========== NIRI PARSER ==========
  function parseNiriConfig(text) {
    var lines = text.split('\n');
    var inBindsBlock = false;
    var braceDepth = 0;
    var currentCategory = null;

    var actionCategories = {
      "spawn": "Applications",
      "focus-column": "Column Navigation",
      "focus-window": "Window Focus",
      "focus-workspace": "Workspace Navigation",
      "move-column": "Move Columns",
      "move-window": "Move Windows",
      "move-window-to-workspace": "Move Windows",
      "consume-window": "Window Management",
      "expel-window": "Window Management",
      "close-window": "Window Management",
      "fullscreen-window": "Window Management",
      "toggle-window-floating": "Window Management",
      "maximize-column": "Column Management",
      "center-column": "Column Management",
      "set-column-width": "Column Width",
      "switch-preset-column-width": "Column Width",
      "reset-window-height": "Window Size",
      "set-window-height": "Window Size",
      "switch-preset-window-height": "Window Size",
      "screenshot": "Screenshots",
      "screenshot-window": "Screenshots",
      "screenshot-screen": "Screenshots",
      "toggle-overview": "Navigation",
      "show-hotkey-overlay": "System",
      "power-off-monitors": "Power",
      "quit": "System",
      "toggle-animation": "Animations"
    };

    var categorizedBinds = {};

    for (var i = 0; i < lines.length; i++) {
      var line = lines[i].trim();

      if (line.startsWith("binds") && line.includes("{")) {
        inBindsBlock = true;
        braceDepth = 1;
        continue;
      }

      if (!inBindsBlock) continue;

      for (var j = 0; j < line.length; j++) {
        if (line[j] === '{') braceDepth++;
        else if (line[j] === '}') braceDepth--;
      }

      if (braceDepth <= 0) {
        inBindsBlock = false;
        break;
      }

      if (line.startsWith("//")) {
        var commentText = line.substring(2).trim();
        if (commentText.length > 0 && commentText.length < 50) {
          currentCategory = commentText;
        }
        continue;
      }

      if (line.length === 0) continue;

      // Parse keybind line - handle hotkey-overlay-title and other attributes
      var bindMatch = line.match(/^([A-Za-z0-9_+]+)\s*(.*?)\{\s*([^}]+)\s*\}/);

      if (bindMatch) {
        var keyCombo = bindMatch[1];
        var attributes = bindMatch[2].trim();
        var action = bindMatch[3].trim().replace(/;$/, '');

        // Extract hotkey-overlay-title if present
        var hotkeyTitle = null;
        var titleMatch = attributes.match(/hotkey-overlay-title="([^"]+)"/);
        if (titleMatch) {
          hotkeyTitle = titleMatch[1];
        }

        var formattedKeys = formatNiriKeyCombo(keyCombo);
        var category = currentCategory || getNiriCategory(action, actionCategories);

        if (!categorizedBinds[category]) {
          categorizedBinds[category] = [];
        }

        // Use hotkey-overlay-title if available, otherwise format action
        var description = hotkeyTitle || formatNiriAction(action);

        categorizedBinds[category].push({
          "keys": formattedKeys,
          "desc": description
        });
      }
    }

    var categoryOrder = [
      "Applications", "Window Management", "Column Navigation",
      "Window Focus", "Workspace Navigation", "Move Columns",
      "Move Windows", "Column Management", "Column Width",
      "Window Size", "Screenshots", "Navigation", "Power", "System", "Animations"
    ];

    var cats = [];
    for (var k = 0; k < categoryOrder.length; k++) {
      var catName = categoryOrder[k];
      if (categorizedBinds[catName] && categorizedBinds[catName].length > 0) {
        cats.push({ "title": catName, "binds": categorizedBinds[catName] });
      }
    }

    for (var cat in categorizedBinds) {
      if (categoryOrder.indexOf(cat) === -1 && categorizedBinds[cat].length > 0) {
        cats.push({ "title": cat, "binds": categorizedBinds[cat] });
      }
    }

    if (cats.length > 0) {
      pluginApi.pluginSettings.cheatsheetData = cats;
      pluginApi.saveSettings();
    } else {
      errorText.text = pluginApi?.tr("keybind-cheatsheet.panel.no-categories") || "No keybindings found in binds block";
      errorView.visible = true;
    }
  }

  function formatNiriKeyCombo(combo) {
    // First handle modifiers
    var formatted = combo
      .replace(/Mod\+/g, "Super + ")
      .replace(/Super\+/g, "Super + ")
      .replace(/Ctrl\+/g, "Ctrl + ")
      .replace(/Control\+/g, "Ctrl + ")
      .replace(/Alt\+/g, "Alt + ")
      .replace(/Shift\+/g, "Shift + ")
      .replace(/Win\+/g, "Super + ")
      .replace(/\+\s*$/, "")
      .replace(/\s+/g, " ")
      .trim();

    // Then format special keys (XF86, Print, etc.)
    var parts = formatted.split(" + ");
    var formattedParts = parts.map(function(part) {
      var trimmed = part.trim();
      // Only format non-modifier keys
      if (["Super", "Ctrl", "Alt", "Shift"].indexOf(trimmed) === -1) {
        return formatSpecialKey(trimmed);
      }
      return trimmed;
    });
    return formattedParts.join(" + ");
  }

  function formatNiriAction(action) {
    if (action.startsWith("spawn")) {
      // Extract all quoted arguments from spawn command
      var args = [];
      var regex = /"([^"]+)"/g;
      var match;
      while ((match = regex.exec(action)) !== null) {
        args.push(match[1]);
      }
      if (args.length > 0) {
        // Show command and key arguments, skip very long technical args
        var displayArgs = args.map(function(arg) {
          // Skip environment variable patterns and very long args
          if (arg.startsWith("@") || arg.length > 30) return null;
          return arg;
        }).filter(function(arg) { return arg !== null; });
        return "Run: " + displayArgs.join(" ");
      }
      return action;
    }
    // Handle actions with parameters like "focus-workspace 1"
    var parts = action.split(/\s+/);
    if (parts.length > 1) {
      var actionName = parts[0].replace(/-/g, ' ').replace(/\b\w/g, function(l) { return l.toUpperCase(); });
      return actionName + " " + parts.slice(1).join(" ");
    }
    return action.replace(/-/g, ' ').replace(/\b\w/g, function(l) { return l.toUpperCase(); });
  }

  function getNiriCategory(action, actionCategories) {
    for (var prefix in actionCategories) {
      if (action.startsWith(prefix)) return actionCategories[prefix];
    }
    return "Other";
  }

  // ========== UI ==========
  Rectangle {
    id: panelContainer
    anchors.fill: parent
    color: Color.mSurface
    radius: Style.radiusL
    clip: true

    Rectangle {
      id: header
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.right: parent.right
      height: 45
      color: Color.mSurfaceVariant
      radius: Style.radiusL

      RowLayout {
        anchors.fill: parent
        anchors.leftMargin: Style.marginM
        anchors.rightMargin: Style.marginM
        spacing: Style.marginS

        // Title section (centered)
        Item { Layout.fillWidth: true }

        NIcon {
          icon: "keyboard"
          pointSize: Style.fontSizeM
          color: Color.mPrimary
        }
        NText {
          text: {
            var title = "Keybind Cheatsheet";
            if (root.compositor) {
              title += " (" + root.compositor.charAt(0).toUpperCase() + root.compositor.slice(1) + ")";
            }
            return title;
          }
          font.pointSize: Style.fontSizeM
          font.weight: Font.Bold
          color: Color.mPrimary
        }

        Item { Layout.fillWidth: true }
      }
    }

    NText {
      id: loadingText
      anchors.centerIn: parent
      text: pluginApi?.tr("keybind-cheatsheet.panel.loading") || "Loading..."
      visible: root.isLoading
      font.pointSize: Style.fontSizeL
      color: Color.mOnSurface
    }

    ColumnLayout {
      id: errorView
      anchors.centerIn: parent
      visible: false
      spacing: Style.marginM
      NIcon {
        icon: "alert-circle"
        pointSize: 48
        Layout.alignment: Qt.AlignHCenter
        color: Color.mError
      }
      NText {
        id: errorText
        text: pluginApi?.tr("keybind-cheatsheet.panel.no-data") || "No data"
        font.pointSize: Style.fontSizeM
        color: Color.mOnSurface
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
      }
      NButton {
        text: pluginApi?.tr("keybind-cheatsheet.panel.refresh") || "Refresh"
        Layout.alignment: Qt.AlignHCenter
        onClicked: {
          pluginApi.pluginSettings.cheatsheetData = [];
          pluginApi.pluginSettings.detectedCompositor = "";
          pluginApi.saveSettings();
          errorView.visible = false;
          root.compositor = "";
          checkAndGenerate();
        }
      }
    }

    RowLayout {
      id: mainLayout
      visible: root.categories.length > 0 && !root.isLoading
      anchors.top: header.bottom
      anchors.bottom: parent.bottom
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.margins: Style.marginM
      spacing: Style.marginS

      Repeater {
        model: root.columnItems.length

        ColumnLayout {
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.alignment: Qt.AlignTop
          spacing: 2

          property var colItems: root.columnItems[index] || []

          Repeater {
            model: colItems
            Loader {
              Layout.fillWidth: true
              sourceComponent: modelData.type === "header" ? headerComponent :
                             (modelData.type === "spacer" ? spacerComponent : bindComponent)
              property var itemData: modelData
            }
          }
        }
      }
    }
  }

  Component {
    id: headerComponent
    RowLayout {
      spacing: Style.marginXS
      Layout.topMargin: Style.marginM
      Layout.bottomMargin: 4
      NIcon {
        icon: "circle-dot"
        pointSize: 10
        color: Color.mPrimary
      }
      NText {
        text: itemData.title
        font.pointSize: 11
        font.weight: Font.Bold
        color: Color.mPrimary
      }
    }
  }

  Component {
    id: spacerComponent
    Item {
      height: 10
      Layout.fillWidth: true
    }
  }

  Component {
    id: bindComponent
    RowLayout {
      spacing: Style.marginS
      height: 22
      Layout.bottomMargin: 1
      Flow {
        Layout.preferredWidth: 220
        Layout.alignment: Qt.AlignVCenter
        spacing: 3
        Repeater {
          model: itemData.keys.split(" + ")
          Rectangle {
            width: keyText.implicitWidth + 10
            height: 18
            color: getKeyColor(modelData)
            radius: 3
            NText {
              id: keyText
              anchors.centerIn: parent
              text: modelData
              font.pointSize: modelData.length > 12 ? 7 : 8
              font.weight: Font.Bold
              color: Color.mOnPrimary
            }
          }
        }
      }
      NText {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignVCenter
        text: itemData.desc
        font.pointSize: 9
        color: Color.mOnSurface
        elide: Text.ElideRight
      }
    }
  }

  function getKeyColor(keyName) {
    if (keyName === "Super") return Color.mPrimary;
    if (keyName === "Ctrl") return Color.mSecondary;
    if (keyName === "Shift") return Color.mTertiary;
    if (keyName === "Alt") return "#FF6B6B";
    if (keyName.startsWith("XF86")) return "#4ECDC4";
    if (keyName === "PRINT" || keyName === "Print") return "#95E1D3";
    if (keyName.match(/^[0-9]$/)) return "#A8DADC";
    if (keyName.includes("MOUSE") || keyName.includes("Wheel")) return "#F38181";
    return Color.mPrimaryContainer || "#6C757D";
  }

  function buildColumnItems(categoryIndices) {
    var result = [];
    if (!categoryIndices) return result;

    for (var i = 0; i < categoryIndices.length; i++) {
      var catIndex = categoryIndices[i];
      if (catIndex >= categories.length) continue;

      var cat = categories[catIndex];
      result.push({ type: "header", title: cat.title });
      for (var j = 0; j < cat.binds.length; j++) {
        result.push({
          type: "bind",
          keys: cat.binds[j].keys,
          desc: cat.binds[j].desc
        });
      }
      if (i < categoryIndices.length - 1) {
        result.push({ type: "spacer" });
      }
    }
    return result;
  }

  function processCategories(cats) {
    if (!cats || cats.length === 0) return [];

    // For Hyprland: split large workspace categories
    if (compositor === "hyprland") {
      var result = [];
      for (var i = 0; i < cats.length; i++) {
        var cat = cats[i];

        if (cat.binds && cat.binds.length > 12 && cat.title.includes("OBSZARY ROBOCZE")) {
          var switching = [], moving = [], mouse = [];

          for (var j = 0; j < cat.binds.length; j++) {
            var bind = cat.binds[j];
            if (bind.keys.includes("MOUSE")) {
              mouse.push(bind);
            } else if (bind.desc.includes("Send") || bind.desc.includes("send") ||
                       bind.desc.includes("Move") || bind.desc.includes("move") ||
                       bind.desc.includes("Wyślij") || bind.desc.includes("wyślij")) {
              moving.push(bind);
            } else {
              switching.push(bind);
            }
          }

          if (switching.length > 0) result.push({ title: "WORKSPACES - SWITCHING", binds: switching });
          if (moving.length > 0) result.push({ title: "WORKSPACES - MOVING", binds: moving });
          if (mouse.length > 0) result.push({ title: "WORKSPACES - MOUSE", binds: mouse });
        } else {
          result.push(cat);
        }
      }
      return result;
    }

    return cats;
  }

  function distributeCategories() {
    var numCols = root.columnCount;

    // Calculate weights for each category
    var catData = [];
    for (var i = 0; i < categories.length; i++) {
      var weight = 1 + categories[i].binds.length + 1; // header + binds + spacer
      catData.push({ index: i, weight: weight });
    }

    // Sort by weight descending (largest categories first for better distribution)
    catData.sort(function(a, b) { return b.weight - a.weight; });

    var columns = [];
    var columnWeights = [];
    for (var c = 0; c < numCols; c++) {
      columns.push([]);
      columnWeights.push(0);
    }

    // Assign each category to the column with smallest current weight
    for (var i = 0; i < catData.length; i++) {
      var minCol = 0;
      for (var c = 1; c < numCols; c++) {
        if (columnWeights[c] < columnWeights[minCol]) {
          minCol = c;
        }
      }
      columns[minCol].push(catData[i].index);
      columnWeights[minCol] += catData[i].weight;
    }

    // Sort categories within each column by original order for consistent display
    for (var c = 0; c < numCols; c++) {
      columns[c].sort(function(a, b) { return a - b; });
    }

    return columns;
  }
}

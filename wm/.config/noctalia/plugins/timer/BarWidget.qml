import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Commons
import qs.Widgets
import qs.Services.UI
import qs.Services.System

Rectangle {
  id: root
  
  property var pluginApi: null
  property ShellScreen screen
  property string widgetId: ""
  property string section: ""

  readonly property var mainInstance: pluginApi?.mainInstance
  readonly property bool isActive: mainInstance && (mainInstance.timerRunning || mainInstance.timerElapsedSeconds > 0 || mainInstance.timerRemainingSeconds > 0)
  
  implicitWidth: {
    if (barIsVertical) return Style.capsuleHeight
    if (isActive) return contentRow.implicitWidth + Style.marginM * 2
    return Style.capsuleHeight
  }
  implicitHeight: Style.capsuleHeight
  
  readonly property string barPosition: Settings.data.bar.position || "top"
  readonly property bool barIsVertical: barPosition === "left" || barPosition === "right"
  
  color: Style.capsuleColor
  
  radius: Style.radiusL
  
  function formatTime(seconds) {
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;

    if (hours > 0) {
      return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }
    return `${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  }
  
  RowLayout {
    id: contentRow
    anchors.centerIn: parent
    spacing: Style.marginS
    
    NIcon {
      icon: {
        if (mainInstance && mainInstance.timerSoundPlaying) return "bell-ringing"
        if (mainInstance && mainInstance.timerStopwatchMode) return "stopwatch"
        return "hourglass"
      }
      applyUiScale: false
      color: {
         if (mainInstance && (mainInstance.timerRunning || mainInstance.timerSoundPlaying)) {
            return Color.mPrimary
         }
         return mouseArea.containsMouse ? Color.mOnHover : Color.mOnSurface
      }
    }
    
    NText {
      visible: !barIsVertical && mainInstance && (mainInstance.timerRunning || mainInstance.timerElapsedSeconds > 0 || mainInstance.timerRemainingSeconds > 0)
      text: {
        if (!mainInstance) return ""
        if (mainInstance.timerStopwatchMode) {
            return formatTime(mainInstance.timerElapsedSeconds)
        }
        return formatTime(mainInstance.timerRemainingSeconds)
      }
      color: {
         if (mainInstance && (mainInstance.timerRunning || mainInstance.timerSoundPlaying)) {
            return Color.mPrimary
         }
         return mouseArea.containsMouse ? Color.mOnHover : Color.mOnSurface
      }
      pointSize: Style.fontSizeS
      font.weight: Font.Medium
    }
  }
  
  NPopupContextMenu {
    id: contextMenu

    model: {
        var items = [];
        
        if (mainInstance) {
            // Pause / Resume & Reset
            if (mainInstance.timerRunning || mainInstance.timerElapsedSeconds > 0 || mainInstance.timerRemainingSeconds > 0) {
                 items.push({
                    "label": mainInstance.timerRunning ? pluginApi.tr("panel.pause") : pluginApi.tr("panel.resume"),
                    "action": "toggle",
                    "icon": mainInstance.timerRunning ? "media-pause" : "media-play"
                });

                items.push({
                    "label": pluginApi.tr("panel.reset"),
                    "action": "reset",
                    "icon": "refresh"
                });
            }
        }
        
        // Settings
        items.push({
            "label": pluginApi.tr("panel.settings"),
            "action": "widget-settings",
            "icon": "settings"
        });
        
        return items;
    }

    onTriggered: action => {
        var popupMenuWindow = PanelService.getPopupMenuWindow(screen);
        if (popupMenuWindow) {
            popupMenuWindow.close();
        }

        if (action === "widget-settings") {
            BarService.openPluginSettings(screen, pluginApi.manifest);
        } else if (mainInstance) {
            if (action === "toggle") {
                 if (mainInstance.timerRunning) {
                    mainInstance.timerPause();
                } else {
                    mainInstance.timerStart(); 
                }
            } else if (action === "reset") {
                mainInstance.timerReset();
            }
        }
    }
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    
    onEntered: {
        if (!mainInstance || (!mainInstance.timerRunning && !mainInstance.timerSoundPlaying)) {
             root.color = Color.mHover
        }
    }
    
    onExited: {
        if (!mainInstance || (!mainInstance.timerRunning && !mainInstance.timerSoundPlaying)) {
             root.color = Style.capsuleColor
        }
    }
    
    onClicked: (mouse) => {
      if (mouse.button === Qt.LeftButton) {
          if (pluginApi) {
            pluginApi.openPanel(root.screen, root)
          }
      } else if (mouse.button === Qt.RightButton) {
          var popupMenuWindow = PanelService.getPopupMenuWindow(screen);
          if (popupMenuWindow) {
              popupMenuWindow.showContextMenu(contextMenu);
              contextMenu.openAtItem(root, screen);
          }
      }
    }
  }
}

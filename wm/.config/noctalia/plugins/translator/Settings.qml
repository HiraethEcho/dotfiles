import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

ColumnLayout {
    id: root

    property var pluginApi: null

    property string editBackend: 
        pluginApi?.pluginSettings?.backend || 
        pluginApi?.manifest?.metadata?.defaultSettings?.backend || 
        "google"

    spacing: Style.marginM

    NComboBox {
        label: pluginApi?.tr("settings.backend.label") || "Translation Backend"
        description: pluginApi?.tr("settings.backend.description") || "Choose the translation service to use"
        model: [
            {
                "key": "google",
                "name": "Google Translate"
            }
        ]
        currentKey: root.editBackend
        onSelected: key => root.editBackend = key
        defaultValue: pluginApi?.manifest?.metadata?.defaultSettings?.backend || "google"
    }

    function saveSettings() {
        if (!pluginApi) return;

        pluginApi.pluginSettings.backend = root.editBackend;
        pluginApi.saveSettings();
    }
}

import QtQuick
import Quickshell
import qs.Commons
import "translatorUtils.js" as TranslatorUtils

Item {
    id: root

    property var pluginApi: null
    property var launcher: null
    property string name: "Translator"
    property var translationCache: ({})
    property var pendingTranslations: ({})

    function getDefaultLanguages() {
        var result = [];
        for (var code in TranslatorUtils.languages) {
            var lang = TranslatorUtils.languages[code];
            var name = pluginApi?.tr("languageNames." + lang.name) || lang.name.charAt(0).toUpperCase() + lang.name.slice(1);
            var desc = pluginApi?.tr("languages." + lang.name) || "Translate to " + lang.name;
            result.push({name: name, desc: desc, code: code});
        }
        return result;
    }

    function handleCommand(searchText) {
        return searchText.startsWith(">translate");
    }

    function commands() {
        return [{
            "name": ">translate",
            "description": pluginApi?.tr("command.description") || "Translate text",
            "icon": "language",
            "isTablerIcon": true,
            "onActivate": function() { launcher.setSearchText(">translate "); }
        }];
    }

    function getResults(searchText) {
        if (!searchText.startsWith(">translate")) return [];

        var parts = searchText.trim().split(" ");
        if (parts.length <= 1) {
            return getDefaultLanguages().map(function(lang) {
                return {
                    "name": lang.name,
                    "description": lang.desc,
                    "icon": "language",
                    "isTablerIcon": true,
                    "onActivate": function() { launcher.setSearchText(">translate " + lang.code + " "); }
                };
            });
        }

        var targetLang = TranslatorUtils.getLanguageCode(parts[1] || "fr") || "fr";
        var textToTranslate = parts.slice(2).join(" ");

        if (!textToTranslate) {
            return [{
                "name": pluginApi?.tr("messages.enterText") || "Type text to translate...",
                "description": pluginApi?.tr("messages.targetLanguage", {code: targetLang}) || "Target language: " + targetLang,
                "icon": "language",
                "isTablerIcon": true
            }];
        }

        var cacheKey = targetLang + "|" + textToTranslate;
        var cached = translationCache[cacheKey];
        if (cached) {
            return [{
                "name": cached,
                "description": pluginApi?.tr("messages.translation", {code: targetLang}) || "Translation (" + targetLang + ")",
                "icon": "language",
                "isTablerIcon": true,
                "onActivate": function() {
                    copyToClipboard(cached);
                    launcher.close();
                }
            }];
        }

        if (!pendingTranslations[cacheKey]) {
            pendingTranslations[cacheKey] = true;
            translateText(textToTranslate, targetLang, cacheKey);
        }

        return [{
            "name": pluginApi?.tr("messages.translating") || "Translating...",
            "description": textToTranslate,
            "icon": "language",
            "isTablerIcon": true
        }];
    }

    function escapeForShell(text) {
        return text.replace(/'/g, "'\\''");
    }

    function copyToClipboard(text) {
        Quickshell.execDetached(["sh", "-c", "printf '%s' '" + escapeForShell(text) + "' | wl-copy"]);
    }

    function getBackend() {
        return pluginApi?.pluginSettings?.backend || pluginApi?.manifest?.metadata?.defaultSettings?.backend || "google";
    }

    function translateText(text, targetLanguage, cacheKey) {
        var backend = getBackend();
        var url = "";
        
        if (backend === "google") {
            url = "https://translate.google.com/translate_a/single?client=gtx&sl=auto&tl=" + targetLanguage + "&dt=t&q=" + encodeURIComponent(text);
        }
        
        if (!url) {
            translationCache[cacheKey] = pluginApi?.tr("messages.error") || "Translation error";
            return;
        }
        
        var xhr = new XMLHttpRequest();
        xhr.open("GET", url);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                delete pendingTranslations[cacheKey];
                if (xhr.status === 200) {
                    try {
                        var response = JSON.parse(xhr.responseText);
                        var translatedText = (response && response[0] && response[0][0] && response[0][0][0]) || "";
                        if (translatedText) {
                            translationCache[cacheKey] = translatedText;
                            if (launcher) {
                                if (typeof launcher.refreshResults === "function") launcher.refreshResults();
                                else if (typeof launcher.updateResults === "function") launcher.updateResults();
                                else if (typeof launcher.requestUpdate === "function") launcher.requestUpdate();
                            }
                        } else {
                            translationCache[cacheKey] = pluginApi?.tr("messages.error") || "Translation error";
                        }
                    } catch (e) {
                        translationCache[cacheKey] = pluginApi?.tr("messages.error") || "Translation error";
                    }
                } else {
                    translationCache[cacheKey] = pluginApi?.tr("messages.connectionError") || "Connection error";
                }
            }
        };
        xhr.send();
    }
}

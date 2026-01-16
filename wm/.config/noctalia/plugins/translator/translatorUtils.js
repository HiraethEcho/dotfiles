.pragma library

var languages = {
    "fr": {name: "french", aliases: ["french", "français", "fr"]},
    "en": {name: "english", aliases: ["english", "anglais", "en"]},
    "es": {name: "spanish", aliases: ["spanish", "espagnol", "es"]},
    "de": {name: "german", aliases: ["german", "allemand", "de"]},
    "it": {name: "italian", aliases: ["italian", "italien", "it"]},
    "pt": {name: "portuguese", aliases: ["portuguese", "portugais", "pt"]}
};

function getLanguageCode(input) {
    if (!input || input.trim() === "") return "";
    var lower = input.toLowerCase();
    for (var code in languages) {
        if (languages[code].aliases.indexOf(lower) !== -1) return code;
    }
    return lower;
}

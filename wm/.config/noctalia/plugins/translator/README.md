# Translator

A launcher provider plugin that allows you to quickly translate text directly from the Noctalia launcher.

## Features

- **Quick Translation**: Translate text instantly from the launcher
- **Multiple Languages**: Support for French, English, Spanish, German, Italian, and Portuguese
- **Auto-detect Source**: Automatically detects the source language
- **Translation Cache**: Caches translations for faster repeated queries
- **Clipboard Integration**: Copy translations to clipboard with a single click

## Usage

1. Open the Noctalia launcher
2. Type `>translate` to enter translation mode
3. Select a target language (or type the language code directly)
4. Type the text you want to translate
5. Click the result to copy it to clipboard

### Examples

```bash
# Translate to French
>translate fr Hello world

# Translate to Spanish
>translate es How are you?

# Translate to German
>translate de Good morning
```

### Supported Languages

- **fr** - French (français)
- **en** - English
- **es** - Spanish (espagnol)
- **de** - German (allemand)
- **it** - Italian (italien)
- **pt** - Portuguese (portuguais)

You can use either the language code or the language name in English or French.

## Configuration

- **Translation Backend**: Choose the translation service to use (currently supports Google Translate)

## IPC Commands

You can quickly open the translator via IPC, which is useful for keybindings:

```bash
# Toggle the translator launcher (opens with >translate )
# Pass empty string "" to use default (no language pre-selected)
qs -c noctalia-shell ipc call plugin:translator toggle ""

# Open translator with a specific language (e.g., French)
qs -c noctalia-shell ipc call plugin:translator toggle "fr"

# You can use language codes or names (fr, french, français, etc.)
qs -c noctalia-shell ipc call plugin:translator toggle "english"
```

### Integration with Keybindings

Add this to your Noctalia keybinds configuration:

```json
{
  "keybinds": {
    "Super+T": "qs -c noctalia-shell ipc call plugin:translator toggle \"\"",
    "Super+Shift+T": "qs -c noctalia-shell ipc call plugin:translator toggle \"fr\""
  }
}
```

- With empty string `""`: Opens the launcher with `>translate ` already entered, ready for you to select a language and type text to translate.
- With a language parameter: Opens the launcher with `>translate [language] ` already entered, ready for you to type text to translate to that language.

## Requirements

- Noctalia 1.0.0 or later
- Internet connection (for translation requests)

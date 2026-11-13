# Indige

A mobile app for practicing Indigenous languages, starting with Purépecha. Built with Flutter. It works offline, needs no account, and has no server or tracking.

> **Status:** early development. Not yet released.

## AI use and data sovereignty

- **AI assisted with:** app code, debugging, and documentation. Tool used: Claude (Anthropic).
- **AI did not:** create, translate, edit, correct, or verify any dictionary content.
- **The language belongs to its community.** Indige is a tool for access, not ownership. Dictionary content comes from online databases and physical dictionaries. Languages vary by region, and Indige presents the dictionary as published by its source.
- **Your practice is private.** No accounts. No servers. No tracking. Your words and favorites stay on your device.

See [AI_POLICY.md](AI_POLICY.md) and [PRIVACY.md](PRIVACY.md).

## Features

- Language selector (Purépecha available; Nahuatl and Maya are placeholders)
- Purépecha dictionary, offline, stored in a local SQLite database
- Práctica and Historia sections (placeholders)

## Run it on your own PC

This app is for **Android/iOS**. `sqflite` does not run in a web browser, so use an emulator or a phone, not Chrome.

1. Install [Flutter](https://docs.flutter.dev/get-started/install), [Android Studio](https://developer.android.com/studio), and [Git](https://git-scm.com). Run `flutter doctor` and make sure Flutter and the Android toolchain are working. (Developed with Flutter `[your version]`.)
2. Clone and install dependencies:
   ```bash
   git clone https://github.com/[username]/[repo].git
   cd [repo]
   flutter pub get
   ```
3. **Add a database.** The real dictionary is not included. Create a placeholder one:
   - Open [DB Browser for SQLite](https://sqlitebrowser.org) and create a new database.
   - Run this SQL:
     ```sql
     CREATE TABLE purhepecha_dictionary (
       purepecha TEXT, pronunciation TEXT, ipa TEXT,
       spanish TEXT, english TEXT, notes TEXT
     );
     INSERT INTO purhepecha_dictionary VALUES
       ('palabra1', '', '', 'ejemplo uno', 'example one', 'placeholder'),
       ('palabra2', '', '', 'ejemplo dos', 'example two', 'placeholder');
     ```
   - Click **Write Changes** and save it as `assets/db/purhe_dict.db`.
4. Create and start an Android emulator in Android Studio (Device Manager).
5. Run on it:
   ```bash
   flutter devices
   flutter run -d emulator-5554
   ```

**Troubleshooting:** if the app shows an old version or an empty list, uninstall it from the emulator and run again. The database is only copied to the device on first launch. If you see `databaseFactory not initialized`, you're running on web. Switch to the emulator.

## Project structure

```
assets/db/purhe_dict.db   # local database (not committed)
lib/main.dart             # language selector
lib/purhe.dart            # Purépecha home
lib/purhe_dict.dart       # dictionary page
lib/database_helper.dart  # copies and queries the local database
```

## Roadmap

- Favorites and custom flashcard practice sets
- Dictionary search
- Nahuatl and Maya dictionaries, and more!

## Credits and license

**Dictionary source:** *Diccionario Purhepecha – Español | Español – Purepecha*, Huichu Kuakari. Permission from the author is pending.

**App code license:** `[license]` (covers the app code only, not dictionary content).

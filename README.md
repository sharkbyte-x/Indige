# Indige

Indige is a Flutter mobile app for practicing and learning indigenous languages. It currently includes a full offline **Purépecha** dictionary stored in a bundled SQLite database. Nahuatl and Maya are placeholders for future work.

## Features

- Language selector home screen (Purépecha, Nahuatl, Maya)
- Purépecha home page with three sections: **Diccionario**, **Práctica**, **Historia**
- **Diccionario**: a scrollable, offline Purépecha-to-Spanish dictionary loaded from SQLite
- **Práctica** and **Historia**: placeholder pages (coming soon)

## Tech stack

- [Flutter](https://flutter.dev) / Dart
- [sqflite](https://pub.dev/packages/sqflite) for SQLite on Android and iOS
- [path](https://pub.dev/packages/path) for file paths

> **Note:** This app is built for **mobile (Android/iOS)**. `sqflite` does not work in a web browser, so run it on an emulator or a phone, not Chrome.

---

## Run it on your own PC

### 1. Install the prerequisites

1. **Flutter SDK**: follow the official guide for your OS: https://docs.flutter.dev/get-started/install
2. **Android Studio** (for the Android SDK and emulator): https://developer.android.com/studio
3. **A code editor**: [VS Code](https://code.visualstudio.com) with the Flutter extension, or Android Studio with the Flutter plugin
4. **Git**: https://git-scm.com

Then check your setup:

```bash
flutter doctor
```

You only need the **Flutter** and **Android toolchain** sections to be working. Warnings about Visual Studio (Windows desktop development) or Chrome can be ignored for this project.

This project was developed and tested with Flutter 3.47.1 (stable) on Windows 11.

### 2. Clone the project

```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Create and start an Android emulator

1. Open **Android Studio**, then go to **More Actions > Virtual Device Manager** (or **Tools > Device Manager**).
2. Click **Create Device**, choose a phone (for example *Medium Phone*), pick a system image, and finish.
3. Click the **play** button next to the device to start it.

### 5. Run the app on the emulator

List connected devices:

```bash
flutter devices
```

Find the Android emulator in the list (it usually looks like `emulator-5554`) and run on it explicitly:

```bash
flutter run -d emulator-5554
```

The first Android build can take a few minutes. When it finishes, you should see the **Indige** language selector.

### 6. Try the dictionary

Tap **Purepecha**, then **Diccionario**. You should see the scrollable Purépecha dictionary.

---

## Project structure

```
indige_flutter_app/
├── assets/
│   └── db/
│       └── purhe_dict.db        # bundled SQLite dictionary
├── lib/
│   ├── main.dart                # language selector (home screen)
│   ├── purhe.dart               # Purépecha home page (3 buttons)
│   ├── purhe_dict.dart          # Diccionario page (reads from SQLite)
│   ├── purhe_practica.dart      # Práctica page (placeholder)
│   ├── purhe_historia.dart      # Historia page (placeholder)
│   └── database_helper.dart     # copies the bundled DB to the device and queries it
└── pubspec.yaml
```

## How the database works

- The dictionary lives in `assets/db/purhe_dict.db` and is declared in `pubspec.yaml`:

  ```yaml
  flutter:
    assets:
      - assets/db/purhe_dict.db
  ```

- On first launch, `database_helper.dart` copies this file from the app bundle to the device's databases folder, then opens it with `sqflite`.
- The table is named `purhepecha_dictionary` and has these columns:

  | Column | Description |
  |---|---|
  | `purepecha` | Purépecha word |
  | `pronunciation` | Pronunciation guide |
  | `ipa` | IPA transcription |
  | `spanish` | Spanish translation |
  | `english` | English translation |
  | `notes` | Extra notes |

- The Diccionario page currently displays `purepecha` and `spanish`.

### Updating the dictionary

1. Export your spreadsheet as a **CSV** (make sure the first row is the header row).
2. Open [DB Browser for SQLite](https://sqlitebrowser.org), create a new database, then **File > Import > Table from CSV file**. Check **Column names in first line**.
3. Name the table `purhepecha_dictionary` (or update the table name in `database_helper.dart` to match).
4. Click **Write Changes**, then save the file as `purhe_dict.db` into `assets/db/`.
5. **Uninstall the app from the emulator** before re-running (see troubleshooting below), because the database is only copied on first launch.

---

## Troubleshooting

| Problem | Fix |
|---|---|
| `databaseFactory not initialized` in the console | You are running on Chrome/web. Run on an Android emulator or phone instead. |
| The app shows an old version of the UI | `flutter clean` does not touch the emulator. Uninstall the app from the emulator, then run `flutter run -d <device-id>` again. |
| Dictionary is empty or shows a spinner forever | The old database is cached on the device. Uninstall the app from the emulator and reinstall. Also confirm the `.db` in `assets/db/` is the latest version. |
| `Unable to load asset` | The asset path in `pubspec.yaml` and in `database_helper.dart` must match the real file, including the `.db` extension. The `assets` folder must sit next to `lib/`, not inside it. |
| `no such table` / `no such column` | The table or column names in the code do not match the ones in the bundled `.db`. |
| Changes to `pubspec.yaml` are not picked up | Stop the app completely and re-run. Hot reload and hot restart do not reload assets. |

To uninstall the app from the emulator via the command line:

```bash
adb uninstall com.example.indige_flutter_app
```

A full clean rebuild:

```bash
flutter clean
flutter pub get
flutter run -d emulator-5554
```

## Roadmap

- Search bar for the dictionary
- Favorite words to create own flash card practice set
- Styled dictionary entries (pronunciation, IPA, English)
- Práctica (flashcard-style practice) page
- Historia page
- Nahuatl and Maya dictionaries

## License

Add your license here.

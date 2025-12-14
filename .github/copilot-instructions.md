# Basketball Counter App - AI Coding Guidelines

## Architecture Overview
This Flutter app implements a basketball score counter with two teams (A and B). The main component `Counter_App` in `lib/home.dart` uses a `Scaffold` with an `AppBar` and a `Column` containing a `Row` of two `Column`s for each team, separated by a `VerticalDivider`.

- **State Management**: Currently a `StatelessWidget` with hardcoded scores. Convert to `StatefulWidget` for dynamic scoring by adding `int teamAScore = 0;` and `int teamBScore = 0;` in `_Counter_AppState`, and use `setState(() => teamAScore += points);` in button `onPressed`.
- **Layout Pattern**: `Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Column(...), VerticalDivider(...), Column(...)])` for side-by-side team sections.

## Key Conventions
- **Color Scheme**: Use `Colors.orangeAccent` for `AppBar` background and `ElevatedButton` backgrounds.
- **Button Styling**: `ElevatedButton(onPressed: (){}, child: Text("Add X Point"), style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent, minimumSize: Size(150, 50)))`
- **Text Styling**: Team names: `TextStyle(fontSize: 50)`, Scores: `TextStyle(fontSize: 150, fontWeight: FontWeight.bold)`
- **Spacing**: `SizedBox(height: 10)` between buttons for vertical padding.

## Developer Workflows
- **Run App**: `flutter run` (select device/emulator)
- **Build APK**: `flutter build apk --release`
- **Test**: `flutter test` (runs `test/widget_test.dart`)
- **Lint**: `flutter analyze` (uses `analysis_options.yaml` with `flutter_lints`)

## Patterns to Follow
- **Widget Structure**: Nest `Column` inside `Row` for team layouts; use `children: []` for multiple widgets.
- **Imports**: Always `import 'package:flutter/material.dart';` at the top.
- **Score Updates**: In `StatefulWidget`, increment scores with `setState(() { teamAScore += 1; });` for +1 button, similarly for +2/+3.
- **No External Dependencies**: Stick to core Flutter SDK; no additional packages needed for basic functionality.

Reference: `lib/home.dart` for UI structure, `lib/main.dart` for app entry.
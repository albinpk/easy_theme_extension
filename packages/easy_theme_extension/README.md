# easy_theme_extension

A zero-boilerplate generator for Flutter `ThemeExtension` classes.

Define your theme as an annotated abstract class. The generator creates the full immutable implementation with constructor, fields, `copyWith`, `lerp` and more.

---

## Installation

```bash
flutter pub add \
  easy_theme_extension \
  dev:easy_theme_extension_builder \
  dev:build_runner
```

---

## Usage

### 1. Define your theme contract

```dart
@easyTheme
abstract class _MyTheme {
  Color? get primary;
  Color? get secondary;
  EdgeInsets get padding;
}
```

### 2. Run the generator

```bash
dart run build_runner build
```

### 3. Use the generated extension

```dart
final theme = ThemeData(
  extensions: [
    MyTheme(
      primary: Colors.blue,
      secondary: Colors.red,
      padding: const EdgeInsets.all(16),
    ),
  ],
);

final myTheme = Theme.of(context).extension<MyTheme>()!;
```

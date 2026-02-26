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
part 'my_colors.g.dart';

@easyTheme
abstract class _MyColors {
  Color get primary;
  Color get secondary;
  Color get textBody;
  Color get textTitle;
  Color get textLabel;
}
```

### 2. Run the generator

```bash
dart run build_runner build
```

<details>
<summary>my_colors.g.dart</summary>

```dart
part of 'my_colors.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> with Diagnosticable implements _MyColors {
  const MyColors({
    required this.primary,
    required this.secondary,
    required this.textBody,
    required this.textTitle,
    required this.textLabel,
  });

  @override
  final Color primary;

  @override
  final Color secondary;

  @override
  final Color textBody;

  @override
  final Color textTitle;

  @override
  final Color textLabel;

  @override
  MyColors copyWith({
    Color? primary,
    Color? secondary,
    Color? textBody,
    Color? textTitle,
    Color? textLabel,
  }) => MyColors(
    primary: primary ?? this.primary,
    secondary: secondary ?? this.secondary,
    textBody: textBody ?? this.textBody,
    textTitle: textTitle ?? this.textTitle,
    textLabel: textLabel ?? this.textLabel,
  );

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      textBody: Color.lerp(textBody, other.textBody, t)!,
      textTitle: Color.lerp(textTitle, other.textTitle, t)!,
      textLabel: Color.lerp(textLabel, other.textLabel, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is MyColors &&
        other.primary == primary &&
        other.secondary == secondary &&
        other.textBody == textBody &&
        other.textTitle == textTitle &&
        other.textLabel == textLabel;
  }

  @override
  int get hashCode => Object.hashAll([
    primary,
    secondary,
    textBody,
    textTitle,
    textLabel,
  ]);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Color>('primary', primary))
      ..add(DiagnosticsProperty<Color>('secondary', secondary))
      ..add(DiagnosticsProperty<Color>('textBody', textBody))
      ..add(DiagnosticsProperty<Color>('textTitle', textTitle))
      ..add(DiagnosticsProperty<Color>('textLabel', textLabel));
  }
}

extension MyColorsBuildContextExtension on BuildContext {
  MyColors get myColors => Theme.of(this).extension<MyColors>()!;
}
```
</details>

### 3. Use the generated extension

```dart
return MaterialApp(
  theme: ThemeData(
    extensions: const [
      MyColors(
        primary: Colors.blue,
        secondary: Colors.red,
        textBody: Colors.black,
        textTitle: Colors.black,
        textLabel: Colors.grey,
      ),
    ],
  ),
);

// Context extension
context.myColors.secondary;
```

---

## Supported Types

See the example app for the full list of supported types and current limitations [here](https://github.com/albinpk/easy_theme_extension/blob/main/packages/easy_theme_extension/example/lib/all_types.dart).

---

## Contributing

Contributions, issues, and suggestions are welcome.
Open an issue or submit a pull request on [GitHub](https://github.com/albinpk/easy_theme_extension)

Package page on [pub.dev](https://pub.dev/packages/easy_theme_extension)

## License

Released under the [MIT License](https://github.com/albinpk/easy_theme_extension/blob/main/packages/easy_theme_extension/LICENSE)

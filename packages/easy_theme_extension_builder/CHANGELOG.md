## 0.0.1-dev.9

 - **FIX**: loosen constraints for analyzer, build, and source_gen.

## 0.0.1-dev.8

> Note: This release has breaking changes.

 - **FIX**: adjust dependency constraints.
 - **FEAT**: add `defaultStaticInstanceAsConst` option to control `const` generation for the static `$default` instance.
 - **FEAT**: Include `ignore_for_file: unnecessary_const` in generated files.
 - **BREAKING** **FIX**: update generated file extension from `.g.dart` to `.theme.g.dart`.

## 0.0.1-dev.7

 - **FEAT**: supports `double` and `WidgetStateProperty<T?>` types.

## 0.0.1-dev.6

 - **REFACTOR**: rename annotations file.
 - **FEAT**: customization options for `EasyTheme` annotation: `contextExtension`, `contextExtensionName`, `defaultStaticInstance`, `diagnosticable`, and `equals`.
 - **FEAT**: generate `==` and `hashCode` for theme extensions.

## 0.0.1-dev.5

 - **FEAT**: add `Diagnosticable` mixin and `debugFillProperties` to generated theme extensions.
 - **FEAT**: generate a static `$default` constant for theme extensions.
 - **FEAT**: generate extension getter on `BuildContext`.

## 0.0.1-dev.4

 - Update a dependency to the latest release.

## 0.0.1-dev.3

 - **DOCS**: update package description and readme files.

## 0.0.1-dev.2

 - **FEAT**: create easy_theme_extension package, its builder.


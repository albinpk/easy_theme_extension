import 'package:meta/meta_meta.dart';

/// Annotation used to generate a theme extension.
@Target({.classType})
class EasyTheme {
  const EasyTheme({
    this.contextExtension,
    this.contextExtensionName,
    this.defaultStaticInstance,
    this.diagnosticable,
    this.equals,
  });

  /// Whether to generate an extension on `BuildContext` to access the theme.
  final bool? contextExtension;

  /// The name of the generated `BuildContext` extension accessor.
  final String? contextExtensionName;

  /// Whether to generate a static instance of the theme
  /// with default values (as `$default`).
  final bool? defaultStaticInstance;

  /// Whether the generated class should mixin `Diagnosticable`.
  final bool? diagnosticable;

  /// Whether to generate equality operators (`==` and `hashCode`).
  final bool? equals;
}

const easyTheme = EasyTheme();

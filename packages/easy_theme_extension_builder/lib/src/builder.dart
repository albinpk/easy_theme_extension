import 'package:build/build.dart';
import 'package:easy_theme_extension_builder/easy_theme_extension_builder.dart';
import 'package:source_gen/source_gen.dart';

/// Builder entry point.
Builder easyThemeBuilder(BuilderOptions options) => PartBuilder(
  [EasyThemeGenerator(options: options)],
  '.g.dart',
  options: options,
);

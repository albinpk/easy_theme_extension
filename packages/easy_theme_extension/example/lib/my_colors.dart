import 'package:easy_theme_extension/easy_theme_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'my_colors.g.dart';

@easyTheme
abstract class _MyColors {
  Color get primary;
  Color get secondary;
  Color get textBody;
  Color get textTitle;
  Color get textLabel;
}

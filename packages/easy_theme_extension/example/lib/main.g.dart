// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'main.dart';

// **************************************************************************
// EasyThemeGenerator
// **************************************************************************

@immutable
class MyTheme extends ThemeExtension<MyTheme> implements _MyTheme {
  const MyTheme({
    required this.primary,
    required this.secondary,
    required this.padding,
  });

  @override
  final Color? primary;

  @override
  final Color? secondary;

  @override
  final EdgeInsets padding;

  @override
  MyTheme copyWith({Color? primary, Color? secondary, EdgeInsets? padding}) =>
      MyTheme(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        padding: padding ?? this.padding,
      );

  @override
  MyTheme lerp(MyTheme? other, double t) {
    if (other is! MyTheme) return this;
    return MyTheme(
      primary: Color.lerp(primary, other.primary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }
}

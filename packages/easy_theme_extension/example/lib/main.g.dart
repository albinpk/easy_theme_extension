// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'main.dart';

// **************************************************************************
// EasyThemeGenerator
// **************************************************************************

@immutable
class AppColors extends ThemeExtension<AppColors> implements _AppColors {
  const AppColors({required this.primary, required this.secondary});

  @override
  final Color? primary;

  @override
  final Color? secondary;

  @override
  AppColors copyWith({Color? primary, Color? secondary}) => AppColors(
    primary: primary ?? this.primary,
    secondary: secondary ?? this.secondary,
  );

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
    );
  }
}

extension AppColorsBuildContextExtension on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

@immutable
class MyTheme extends ThemeExtension<MyTheme> implements _MyTheme {
  const MyTheme({required this.padding, required this.gradient});

  @override
  final EdgeInsets padding;

  @override
  final LinearGradient? gradient;

  @override
  MyTheme copyWith({EdgeInsets? padding, LinearGradient? gradient}) => MyTheme(
    padding: padding ?? this.padding,
    gradient: gradient ?? this.gradient,
  );

  @override
  MyTheme lerp(MyTheme? other, double t) {
    if (other is! MyTheme) return this;
    return MyTheme(
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      gradient: LinearGradient.lerp(gradient, other.gradient, t),
    );
  }
}

extension MyThemeBuildContextExtension on BuildContext {
  MyTheme get myTheme => Theme.of(this).extension<MyTheme>()!;
}

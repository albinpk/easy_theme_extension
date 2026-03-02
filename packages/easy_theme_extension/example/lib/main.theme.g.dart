// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'main.dart';

// **************************************************************************
// EasyThemeGenerator
// **************************************************************************

@immutable
class AppColors extends ThemeExtension<AppColors>
    with Diagnosticable
    implements _AppColors {
  const AppColors({required this.primary, required this.textColor});

  @override
  final Color primary;

  @override
  final Color textColor;

  @override
  AppColors copyWith({Color? primary, Color? textColor}) => AppColors(
    primary: primary ?? this.primary,
    textColor: textColor ?? this.textColor,
  );

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AppColors &&
        other.primary == primary &&
        other.textColor == textColor;
  }

  @override
  int get hashCode => Object.hashAll([primary, textColor]);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Color>('primary', primary))
      ..add(DiagnosticsProperty<Color>('textColor', textColor));
  }
}

extension AppColorsBuildContextExtension on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

@immutable
class MyTheme extends ThemeExtension<MyTheme>
    with Diagnosticable
    implements _MyTheme {
  const MyTheme({required this.padding, required this.gradient});

  @override
  final EdgeInsets padding;

  @override
  final LinearGradient gradient;

  static const $default = MyTheme(
    padding: const .all(4),
    gradient: const .new(colors: [Colors.blue, Colors.cyan]),
  );

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
      gradient: LinearGradient.lerp(gradient, other.gradient, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is MyTheme &&
        other.padding == padding &&
        other.gradient == gradient;
  }

  @override
  int get hashCode => Object.hashAll([padding, gradient]);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DiagnosticsProperty<LinearGradient>('gradient', gradient));
  }
}

extension MyThemeBuildContextExtension on BuildContext {
  MyTheme get theme => Theme.of(this).extension<MyTheme>()!;
}

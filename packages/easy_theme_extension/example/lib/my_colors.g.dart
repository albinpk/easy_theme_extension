// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'my_colors.dart';

// **************************************************************************
// EasyThemeGenerator
// **************************************************************************

@immutable
class MyColors extends ThemeExtension<MyColors>
    with Diagnosticable
    implements _MyColors {
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
  int get hashCode =>
      Object.hashAll([primary, secondary, textBody, textTitle, textLabel]);

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

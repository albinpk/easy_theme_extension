import 'dart:ui';

import 'package:easy_theme_extension/easy_theme_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'all_types.g.dart';

@easyTheme
abstract class _AllTypes {
  ActionIconThemeData? get actionIconThemeData;
  Alignment? get alignment;
  AlignmentDirectional? get alignmentDirectional;
  AlignmentGeometry? get alignmentGeometry;
  AnimationStyle? get animationStyle;
  AppBarTheme? get appBarTheme;
  AppBarThemeData get appBarThemeData; // nullable not supported
  BadgeThemeData? get badgeThemeData;
  Border? get border;
  BorderDirectional? get borderDirectional;
  BorderRadius? get borderRadius;
  BorderRadiusDirectional? get borderRadiusDirectional;
  BorderRadiusGeometry? get borderRadiusGeometry;
  BorderSide get borderSide; // nullable not supported
  BottomAppBarTheme? get bottomAppBarTheme;
  BottomAppBarThemeData? get bottomAppBarThemeData;
  BottomNavigationBarThemeData? get bottomNavigationBarThemeData;
  BottomSheetThemeData? get bottomSheetThemeData;
  BoxBorder? get boxBorder;
  BoxConstraints? get boxConstraints;
  BoxDecoration? get boxDecoration;
  BoxShadow? get boxShadow;
  ButtonStyle? get buttonStyle;
  CardTheme? get cardTheme;
  CardThemeData? get cardThemeData;
  CarouselViewThemeData? get carouselViewThemeData;
  CheckboxThemeData? get checkboxThemeData;
  ChipThemeData? get chipThemeData;
  Color? get color;
  ColorScheme get colorScheme;
  DataTableThemeData get dataTableThemeData; // nullable not supported
  DatePickerThemeData? get datePickerThemeData;
  Decoration? get decoration;
  DecorationImage? get decorationImage;
  DialogTheme? get dialogTheme;
  DialogThemeData? get dialogThemeData;
  DividerThemeData? get dividerThemeData;
  double? get x;
  DrawerThemeData? get drawerThemeData;
  DropdownMenuThemeData? get dropdownMenuThemeData;
  EdgeInsets? get edgeInsets;
  EdgeInsetsDirectional? get edgeInsetsDirectional;
  EdgeInsetsGeometry? get edgeInsetsGeometry;
  ElevatedButtonThemeData? get elevatedButtonThemeData;
  ExpansionTileThemeData? get expansionTileThemeData;
  FilledButtonThemeData? get filledButtonThemeData;
  FloatingActionButtonThemeData? get floatingActionButtonThemeData;
  FlutterLogoDecoration? get flutterLogoDecoration;
  FontVariation? get fontVariation;
  FontWeight? get fontWeight;
  FractionalOffset? get fractionalOffset;
  Gradient? get gradient;
  HSLColor? get hSLColor;
  HSVColor? get hSVColor;
  IconButtonThemeData? get iconButtonThemeData;
  IconThemeData? get iconThemeData;
  LinearBorderEdge? get linearBorderEdge;
  LinearGradient? get linearGradient;
  ListTileThemeData? get listTileThemeData;
  MaterialBannerThemeData? get materialBannerThemeData;
  MenuBarThemeData? get menuBarThemeData;
  MenuButtonThemeData? get menuButtonThemeData;
  MenuStyle? get menuStyle;
  MenuThemeData? get menuThemeData;
  NavigationBarThemeData? get navigationBarThemeData;
  NavigationDrawerThemeData? get navigationDrawerThemeData;
  NavigationRailThemeData? get navigationRailThemeData;
  Offset? get offset;
  OutlinedBorder? get outlinedBorder;
  OutlinedButtonThemeData? get outlinedButtonThemeData;
  PopupMenuThemeData? get popupMenuThemeData;
  ProgressIndicatorThemeData? get progressIndicatorThemeData;
  RadialGradient? get radialGradient;
  RadioThemeData? get radioThemeData;
  Radius? get radius;
  Rect? get rect;
  RelativeRect? get relativeRect;
  RRect? get rRect;
  RSuperellipse? get rSuperellipse;
  ScrollbarThemeData? get scrollbarThemeData;
  SearchBarThemeData? get searchBarThemeData;
  SearchViewThemeData? get searchViewThemeData;
  SegmentedButtonThemeData? get segmentedButtonThemeData;
  Shadow? get shadow;
  ShapeBorder? get shapeBorder;
  ShapeDecoration get shapeDecoration;
  Size? get size;
  SliderThemeData get sliderThemeData; // nullable not supported
  SnackBarThemeData? get snackBarThemeData;
  SweepGradient? get sweepGradient;
  SwitchThemeData? get switchThemeData;
  TabBarTheme get tabBarTheme; // nullable not supported
  TabBarThemeData get tabBarThemeData; // nullable not supported
  TableBorder? get tableBorder;
  TextButtonThemeData? get textButtonThemeData;
  TextSelectionThemeData? get textSelectionThemeData;
  TextStyle? get textStyle;
  TextTheme? get textTheme;
  ThemeData get themeData; // nullable not supported
  TimePickerThemeData? get timePickerThemeData;
  ToggleButtonsThemeData? get toggleButtonsThemeData;
  TooltipThemeData? get tooltipThemeData;
  Typography get typography; // nullable not supported
  VisualDensity get visualDensity; // nullable not supported
  // WidgetStateProperty<T> - support all nullable types above
  WidgetStateProperty<TooltipThemeData?> get widgetStateProperty;
}

import 'package:easy_theme_extension/easy_theme_extension.dart';
import 'package:flutter/material.dart';

part 'main.g.dart';

@easyTheme
abstract class _AppColors {
  Color? get primary;
  Color? get secondary;
}

@easyTheme
abstract class _MyTheme {
  EdgeInsets get padding;
  LinearGradient? get gradient;
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

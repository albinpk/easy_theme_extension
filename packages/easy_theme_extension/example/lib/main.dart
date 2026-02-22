import 'package:easy_theme_extension/easy_theme_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'main.g.dart';

@easyTheme
abstract class _AppColors {
  Color get primary;
  Color get textColor;
}

@easyTheme
abstract class _MyTheme {
  EdgeInsets get padding => const .all(4);
  LinearGradient get gradient => const .new(colors: [Colors.blue, Colors.cyan]);
}

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: const [
          MyTheme.$default, // instance with default values
          AppColors(
            primary: Colors.blue,
            textColor: Colors.lightBlue,
          ),
        ],
      ),
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) {
              return Text(
                'Hello World!',
                style: TextStyle(
                  // context extension
                  color: context.appColors.textColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

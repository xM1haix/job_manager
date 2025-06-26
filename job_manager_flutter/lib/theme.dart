import 'package:flutter/material.dart';

class CustomTheme {
  final centerTitle = true;
  final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(centerTitle: true),
    scaffoldBackgroundColor: Colors.black,
    tooltipTheme: TooltipThemeData(
      enableFeedback: true,
      textStyle: TextStyle(
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    ),
  );
  ThemeData get theme => ThemeData(
        appBarTheme: AppBarTheme(centerTitle: centerTitle),
        // scaffoldBackgroundColor: Colors.black,
        tooltipTheme: TooltipThemeData(
          enableFeedback: true,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          textStyle: TextStyle(
              // color: Colors.white,
              ),
        ),
      );
}

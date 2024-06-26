import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    switchTheme: SwitchThemeData(trackColor: MaterialStateProperty.all(Colors.green) )
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
);
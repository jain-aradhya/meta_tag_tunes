import 'package:flutter/material.dart';


ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
    ),
  ),
);

 ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  appBarTheme:  const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
    ),
  ),
);
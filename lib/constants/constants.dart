import 'package:flutter/material.dart';

/// Light Theme Data used when Brightness is LIGHT.
ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 0),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.tealAccent,
      fontSize: 48,
      fontWeight: FontWeight.w600,
    ),
  ),
);

/// Dark Theme Data used when Brightness is DARK.
ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xff2b2b2b),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 0),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xff2b2b2b),
    titleTextStyle: TextStyle(
      color: Colors.tealAccent,
      fontSize: 48,
      fontWeight: FontWeight.w600,
    ),
  ),
);

/// A helper method for displaying SnackBar (for debugging purposes).
void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        milliseconds: 400,
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xff2b2b2b) : Colors.white,
      content: Text(
        message,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}

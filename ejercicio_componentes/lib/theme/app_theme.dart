import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.indigo, // Color primario
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0
    ), // Tema appbar
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    )
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.indigo, // Color primario
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0
    ), // Tema appbar
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    scaffoldBackgroundColor: Colors.black
  );
}
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lighttheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xfffb7883),
    appBarTheme: const AppBarTheme(
      color: Color(0xfffb7883),
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
  static final ThemeData darktheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff16213E),
      appBarTheme: const AppBarTheme(color: Colors.teal),
      iconTheme: const IconThemeData(color: Colors.black));
}

import 'package:flutter/material.dart';

class themes {
  final ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );

  final ThemeData darktheme = ThemeData(
    brightness: Brightness.dark,
  );
}

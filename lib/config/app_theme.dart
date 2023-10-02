import 'package:flutter/material.dart';

import 'constants_colors.dart';

AppBarTheme appBarTheme =
    const AppBarTheme(color: Colors.transparent, elevation: 0);

ThemeData lightThemeData() {
  return ThemeData(
    useMaterial3: true,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: lightBackgroundColor,
    shadowColor: lightShadowColor,
    colorScheme: const ColorScheme.light(
      background: lightShadowColor,
      secondary: lightBackgroundColor,
      surface: lightShadowColor,
      onPrimary: Colors.black54,
    ),
  );
}

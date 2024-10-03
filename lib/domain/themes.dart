import 'package:flutter/material.dart';
import 'package:readquran/domain/colors.dart';

const TextTheme baseTextTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 24, fontFamily: 'amiri', height: 2),
    bodyMedium: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
    bodySmall: TextStyle(fontSize: 12),
  );

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.light(
    primary: lightPrimaryColor,
    secondary: lightSecondaryColor,
  ),
  brightness: Brightness.light,
  textTheme: baseTextTheme,
  cardTheme: const CardTheme(
    color: lightCardColor
  ),
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  colorScheme: const ColorScheme.dark(
    primary: darkPrimaryColor,
    secondary: darkSecondaryColor,
    onSurface: darkOnSurfaceColor,
  ),
  brightness: Brightness.dark,
  textTheme: baseTextTheme,
  cardTheme: const CardTheme(
    color: darkCardColor
  ),
);
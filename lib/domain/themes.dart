import 'package:flutter/material.dart';

const TextTheme baseTextTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 24),
    bodyMedium: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
    bodySmall: TextStyle(fontSize: 12),
  );

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.light(
    secondary: Color.fromARGB(255, 236, 248, 238)
  ),
  brightness: Brightness.light,
  textTheme: baseTextTheme,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  colorScheme: const ColorScheme.dark(
    secondary: Color.fromARGB(255, 49, 49, 49)
  ),
  brightness: Brightness.dark,
  textTheme: baseTextTheme,
  cardTheme: const CardTheme(
    color: Color.fromARGB(255, 31, 31, 31),
  ),
);
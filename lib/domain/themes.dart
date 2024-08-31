import 'package:flutter/material.dart';

const TextTheme baseTextTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    bodyLarge: TextStyle(fontSize: 24),
    bodyMedium: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
    bodySmall: TextStyle(fontSize: 12),
  );

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 12, 75, 23),
    secondary: Color.fromARGB(255, 236, 248, 238),
   // surface: Color.fromARGB(255, 236, 248, 238),
  ),
  brightness: Brightness.light,
  textTheme: baseTextTheme,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 148, 148, 148),
    secondary: Color.fromARGB(255, 29, 29, 29),
    onSurface: Color.fromARGB(255, 201, 201, 201),
  ),
  brightness: Brightness.dark,
  textTheme: baseTextTheme,
  cardTheme: const CardTheme(
    color: Color.fromARGB(255, 31, 31, 31),
  ),
);
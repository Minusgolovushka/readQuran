import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final String themeBoxName = 'settingsBox';
  final String _themeKey = 'themeMode';

  ThemeNotifier() : super(ThemeMode.system) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final box = await Hive.openBox(themeBoxName);
    final storedTheme = box.get(_themeKey, defaultValue: 'System');

    switch (storedTheme) {
      case 'Light':
        state = ThemeMode.light;
        break;
      case 'Dark':
        state = ThemeMode.dark;
        break;
      case 'System':
      default:
        state = ThemeMode.system;
        break;
    }
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    state = themeMode;

    final box = await Hive.openBox(themeBoxName);
    String themeString;

    if (themeMode == ThemeMode.light) {
      themeString = 'Light';
    } else if (themeMode == ThemeMode.dark) {
      themeString = 'Dark';
    } else {
      themeString = 'System';
    }

    await box.put(_themeKey, themeString);
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref){
  return ThemeNotifier();
});

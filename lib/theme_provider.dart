import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString("theme");

    if (saved == "light") {
      state = ThemeMode.light;
    } else if (saved == "dark") {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.system; // Default
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;

    final prefs = await SharedPreferences.getInstance();
    if (mode == ThemeMode.system) {
      await prefs.remove("theme");
    } else if (mode == ThemeMode.light) {
      await prefs.setString("theme", "light");
    } else if (mode == ThemeMode.dark) {
      await prefs.setString("theme", "dark");
    }
  }
}

final themeProvider =
StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

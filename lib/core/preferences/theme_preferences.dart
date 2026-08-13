import 'package:deskcar/core/constants/storage_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ThemePreferences {
  ThemePreferences(this._preferences);

  final SharedPreferences _preferences;

  ThemeMode loadThemeMode() {
    final value = _preferences.getString(StorageConstants.themeModeKey);
    return switch (value) {
      'dark' => ThemeMode.dark,
      _ => ThemeMode.light,
    };
  }

  Future<void> saveThemeMode(ThemeMode themeMode) {
    final value = themeMode == ThemeMode.dark ? 'dark' : 'light';
    return _preferences.setString(StorageConstants.themeModeKey, value);
  }
}

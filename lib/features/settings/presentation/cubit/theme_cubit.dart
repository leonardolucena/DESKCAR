import 'package:deskcar/core/preferences/theme_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._themePreferences) : super(ThemeMode.light);

  final ThemePreferences _themePreferences;

  Future<void> load() async {
    emit(_themePreferences.loadThemeMode());
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    if (state == themeMode) {
      return;
    }

    await _themePreferences.saveThemeMode(themeMode);
    emit(themeMode);
  }
}

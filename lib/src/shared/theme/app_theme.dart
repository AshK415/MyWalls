import 'package:flutter/material.dart';
import 'package:mywalls/src/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  ThemeMode currentTheme = ThemeMode.system;
  late SharedPreferences _prefs;
  @override
  ThemeMode build() {
    _prefs = ref.watch(sharedPreferencesProvider).asData!.value;
    var tm = true;
    if (_prefs.getBool('isDarkMode') == null) {
      save(ival: tm);
    } else {
      tm = _prefs.getBool('isDarkMode')!;
    }

    return (tm == true) ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> save({required bool ival}) async {
    await _prefs.setBool('isDarkMode', ival);
  }

  Future<void> toggle() async {
    var isDark = false;
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      isDark = true;
    } else {
      state = ThemeMode.light;
    }
    await _prefs.setBool('isDarkMode', isDark);
  }
}

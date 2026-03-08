import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/services/cahce_helper.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_getInitialTheme());
  static ThemeMode _getInitialTheme() {
    final isDarkMode = CacheHelper.getData(key: kIsDarkMode);
    if (isDarkMode != null && isDarkMode is bool) {
      return isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
    return ThemeMode.light;
  }

  void toggleTheme() {
    final isCurrentlyDark = state == ThemeMode.dark;

    final newTheme = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;

    CacheHelper.saveData(key: 'isDarkMode', value: !isCurrentlyDark);

    emit(newTheme);
  }
}

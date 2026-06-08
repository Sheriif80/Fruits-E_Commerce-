import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/services/cahce_helper.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(_getInitialLocale());

  static Locale _getInitialLocale() {
    final langCode = CacheHelper.getData(key: kAppLocale);
    if (langCode != null && langCode is String) {
      return Locale(langCode);
    }
    return const Locale('ar');
  }

  void setLocale(Locale locale) {
    CacheHelper.saveData(key: kAppLocale, value: locale.languageCode);
    emit(locale);
  }

  void toggleLanguage() {
    final newLocale = state.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');
    setLocale(newLocale);
  }
}

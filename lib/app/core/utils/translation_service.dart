import 'package:apmatik/app/core/translation/en_Us.dart';
import 'package:apmatik/app/core/translation/tr_TR.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static const locale = Locale('tr', 'TR');
  static const fallbackLocale = Locale('tr', 'TR');

  static final languages = ['Turkish', 'English'];

  static final locales = [const Locale('tr', 'TR'), const Locale('en', 'US')];

  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'tr': tr};

  void changeLocale(String language) {
    _getLocaleFromLanguages(language);
  }

  Locale _getLocaleFromLanguages(String lang) {
    for (var i = 0; i < languages.length; i++) {
      if (lang == languages[i]) return locales[i];
    }
    return Get.locale!;
  }
}

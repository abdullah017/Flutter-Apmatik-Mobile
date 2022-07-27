import 'package:apmatik/app/core/translation/en_Us.dart';
import 'package:apmatik/app/core/translation/tr_TR.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static final locale = Locale('tr', 'TR');
  static final fallbackLocale = Locale('tr', 'TR');

  static final Languages = ['Turkish', 'English'];

  static final locales = [Locale('tr', 'TR'), Locale('en', 'US')];

  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'tr': tr};

  void changeLocale(String language) {
    _getLocaleFromLanguages(language);
  }

  Locale _getLocaleFromLanguages(String lang) {
    for (var i = 0; i < Languages.length; i++) {
      if (lang == Languages[i]) return locales[i];
    }
    return Get.locale!;
  }
}

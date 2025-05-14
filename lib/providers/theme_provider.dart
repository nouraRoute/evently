import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  String appLocal = 'en';
  changeAppTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  String getAppLocalString() {
    return appLocal == 'en' ? 'ar' : 'en';
  }

  changeLocale() {
    if (appLocal == 'en') {
      appLocal = 'ar';
    } else {
      appLocal = 'en';
    }
    notifyListeners();
  }
}

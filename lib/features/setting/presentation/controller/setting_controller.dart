import 'package:BrainScopeAI/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SettingsController extends GetxController {
  // Keys for Hive storage
  static const String _themeKey = 'isDarkMode';
  static const String _localeKey = 'locale';

  // Hive box name
  static const String _boxName = 'settings';

  // Observable for dark mode
  var isDarkMode = false.obs;

  // Observable for locale
  var currentLocale = 'en'.obs; // Default to English

  // Hive box reference
  late Box _settingsBox;

  @override
  void onInit() {
    super.onInit();
    _initHive();
  }

  // Initialize Hive and load preferences
  Future<void> _initHive() async {
    _settingsBox = await Hive.openBox(_boxName);
    // Load saved theme preference, default to false (light mode)
    isDarkMode.value = _settingsBox.get(_themeKey, defaultValue: false) as bool;
    // Load saved locale preference, default to 'en'
    currentLocale.value =
        _settingsBox.get(_localeKey, defaultValue: 'en') as String;
    // Update app theme and locale
    _updateTheme();
    _updateLocale();
  }

  // Toggle theme and save preference
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _settingsBox.put(_themeKey, isDarkMode.value);
    _updateTheme();
  }

  // Update the app's theme
  void _updateTheme() {
    Get.changeTheme(isDarkMode.value ? appThemeDark() : appThemeLight());
  }

  // Get current theme mode
  ThemeMode getCurrentTheme() {
    return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  // Change locale and save preference
  void changeLocale(String locale) {
    currentLocale.value = locale;
    _settingsBox.put(_localeKey, locale);
    _updateLocale();
  }

  // Update the app's locale
  void _updateLocale() {
    Get.updateLocale(Locale(currentLocale.value));
  }

  @override
  void onClose() {
    _settingsBox.close();
    super.onClose();
  }
}

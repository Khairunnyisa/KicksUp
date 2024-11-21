import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // setter
  bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme();
  }

  // getter
  bool get isDarkTheme => _isDarkTheme;
  // untuk meng handle konfigurasi perubahan tema secara lokal
  void toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    // setbool => key & value
    await prefs.setBool("isDarkTheme", isDark);
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ?? => elvis operator: for defining a default value in our variable (to avoid NPE)
    // getbool => key aja
    _isDarkTheme = prefs.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }
}

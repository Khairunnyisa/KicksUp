import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// mengimplementasikan konsep OOP --> inheritance
class ThemeProvider extends ChangeNotifier {
  // setter: sebuah variable yang bersifat privat
  bool _isDarkTheme = false;

  // function loadthem proses ini akan dijalanakan oleh themeprovider
  // provider: mangement state
  ThemeProvider() {
    _loadTheme();
  }

  // getter: bersifat public, bisa diakses di file lain
  bool get isDarkTheme => _isDarkTheme;
  // untuk meng handle konfigurasi perubahan tema secara lokal
  void toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    // setbool => key & value
    await prefs.setBool("isDarkTheme", isDark);
    // notifyListeners: record semua perubahan
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ?? => elvis operator: for defining a default value in our variable (to avoid NPE)
    // getbool => key aja
    // kalau mau buat function tipe data boolean harus pake is
    // pake false karena udh default nya
    _isDarkTheme = prefs.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }
}

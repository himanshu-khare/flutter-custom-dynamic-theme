import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _prefs;
  late bool _darktheme;

  bool get darkTheme => _darktheme;

  AppTheme() {
    _darktheme = true;
    _loadprefs();
  }

  switchthemelight() {
    _darktheme = false;
    _saveprefs();
    notifyListeners();
  }

  switchthemedark() {
    _darktheme = true;
    _saveprefs();
    notifyListeners();
  }

  _initiateprefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadprefs() async {
    await _initiateprefs();
    _darktheme = _prefs?.getBool(key) ?? true;
    notifyListeners();
  }

  _saveprefs() async {
    await _initiateprefs();
    _prefs?.setBool(key, _darktheme);
  }
}
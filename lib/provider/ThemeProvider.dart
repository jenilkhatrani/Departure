import 'package:bhagvat_geeta/model/ThemeModel.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isThemeDark: false);

  void theme() {
    themeModel.isThemeDark = !themeModel.isThemeDark;
    notifyListeners();
  }
}

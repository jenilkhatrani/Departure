import 'package:bhagvat_geeta/model/LanguageModel.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  LanguageModel languageModel = LanguageModel(isHindi: true);

  void language() {
    languageModel.isHindi = !languageModel.isHindi;
    notifyListeners();
  }
}

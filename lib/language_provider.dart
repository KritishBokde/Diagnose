import 'package:flutter/cupertino.dart';
class LanguageProvider extends ChangeNotifier {
  static const List<Map<String, dynamic>> languages = [
    {
      "name" : "English",
      "locale" : "en"
    },
    {
      "name" : "Hindi",
      "locale" : "hi"
    }
  ];
  Locale selectedLocale = const Locale('en');
  void changeLanguage(String language) {
    selectedLocale = Locale(language);
    notifyListeners();
  }
}
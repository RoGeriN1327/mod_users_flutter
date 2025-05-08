import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool getTheme() => _prefs.getBool('isDarkTheme') ?? false;
  static void saveTheme(bool value) => _prefs.setBool('isDarkTheme', value);

  static String getLanguage() => _prefs.getString('language') ?? 'pt';
  static void saveLanguage(String value) => _prefs.setString('language', value);

  static List<String> getUsers() => _prefs.getStringList('users') ?? [];
  static void saveUsers(List<String> users) =>
      _prefs.setStringList('users', users);
}

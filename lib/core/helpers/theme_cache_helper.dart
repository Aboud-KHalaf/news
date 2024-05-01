import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  final String themeKey = 'theme';

  Future<void> setNewTheme(int themeIndex) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(themeKey, themeIndex);
  }

  Future<int> getAppTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int theme = sharedPreferences.getInt(themeKey) ?? 0;

    return theme;
  }
}
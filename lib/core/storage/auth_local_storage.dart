import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  static SharedPreferences? prefs;
  final String _key = 'token';

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  String get() {
    return prefs!.getString(_key) ?? '';
  }

  Future<void> set(String value) async {
    await prefs!.setString(_key, value);
  }

  Future<void> delete() async {
    await prefs!.remove(_key);
  }
}

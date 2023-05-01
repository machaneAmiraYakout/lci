import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) return await prefs.setString(key, value);
    return await prefs.setBool(key, value);
  }
  static dynamic importData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }
  static Future<bool> removeData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}

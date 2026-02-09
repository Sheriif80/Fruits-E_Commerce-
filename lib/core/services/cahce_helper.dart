import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // 1. Private constructor for Singleton pattern
  CacheHelper._internal();

  // 2. The single instance
  static final CacheHelper _instance = CacheHelper._internal();

  // 3. Factory constructor to return the same instance
  factory CacheHelper() {
    return _instance;
  }

  static late SharedPreferences _sharedPreferences;

  /// Initialize SharedPreferences (Call this in main.dart)
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Generic method to save data (String, int, bool, double)
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);

    return await _sharedPreferences.setString(key, value.toString());
  }

  /// Get data using a specific key (Returns dynamic, cast as needed)
  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  /// Remove a specific key
  static Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  /// Clear all data (Logout scenarios)
  static Future<bool> clearData() async {
    return await _sharedPreferences.clear();
  }

  /// Check if a key exists
  static bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }
}

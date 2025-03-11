import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  const Preferences._();

  /// Define the keys for the preferences.
  static const _recentCourse = "recentCourse";

  /// Shared Preferences Instance.
  static late final SharedPreferences _prefs;

  /// Initialize the preferences.
  static Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save the recent course name.
  static Future<bool> saveRecentCourse(String name) async {
    return await _prefs.setString(_recentCourse, name);
  }

  /// Get the recent course name.
  static String? getRecentCourse() {
    return _prefs.getString(_recentCourse);
  }
}

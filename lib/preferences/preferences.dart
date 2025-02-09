import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  const Preferences._();

  static const _recentCourseIndex = "recentCourseIndex";

  static late final SharedPreferences _prefs;

  static Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveRecentCourse(String name) async {
    return await _prefs.setString(_recentCourseIndex, name);
  }

  static String? getRecentCourse() {
    return _prefs.getString(_recentCourseIndex);
  }
}

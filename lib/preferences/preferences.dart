import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  const Preferences._();

  static const _recentCourse = "recentCourse";
  static const _attemptedQuizzesKey = "attemptedQuizzes";

  static late final SharedPreferences _prefs;

  static Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveRecentCourse(String name) async {
    return await _prefs.setString(_recentCourse, name);
  }

  static String? getRecentCourse() {
    return _prefs.getString(_recentCourse);
  }

  /// Save attempted quiz answers (per quiz ID or language ID)
  static const _attemptedQuizKey = "attemptedQuiz";

  /// Save attempted data with correct answers
  static Future<void> saveQuizResult(
      String quizId, Map<String, String> resultMap) async {
    // final existing = _prefs.getString(_attemptedQuizKey);
    // Map<String, dynamic> attempted = {};

    // if (existing != null) {
    //   attempted = Map<String, dynamic>.from(jsonDecode(existing));
    // }

    // attempted[quizId] = resultMap;
    // log("the quiz submit");

    await _prefs.setString(_attemptedQuizKey + quizId, jsonEncode(resultMap));
  }

  /// Get attempted data
  static Map<String, dynamic>? getQuizResult(String quizId) {
    final data = _prefs.getString(_attemptedQuizKey + quizId);

    final attempted = data != null ? jsonDecode(data) : null;
    // if (!attempted.containsKey(quizId)) return null;

    return attempted;
  }

  /// Retrieve attempted quiz answers
  static Map<int, String?>? getAttemptedQuiz(String quizId) {
    final jsonStr = _prefs.getString(_attemptedQuizzesKey);
    if (jsonStr == null) return null;

    final Map<String, dynamic> data = jsonDecode(jsonStr);
    if (!data.containsKey(quizId)) return null;

    final Map<String, dynamic> answerMap = data[quizId];
    return answerMap
        .map((key, value) => MapEntry(int.parse(key), value as String?));
  }
}

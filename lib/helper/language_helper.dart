import '../data/languages.dart';
import '../model/language_model.dart';
import '../preferences/preferences.dart';

class LanguageHelper {
  const LanguageHelper._();

  static LanguageModel? get recentLanguage {
    final String? recentLanguageName = Preferences.getRecentCourse();
    if (recentLanguageName == null) return null;
    return languages.firstWhere((e) => e.name == recentLanguageName);
  }

  static List<LanguageModel> get language {
    final String? recentLanguageName = Preferences.getRecentCourse();

    if (recentLanguageName == null) return languages;
    return languages.where((e) => e.name != recentLanguageName).toList();
  }
}

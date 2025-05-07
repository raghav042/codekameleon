import 'package:codekameleon/data/javascript/javascript_quizes.dart';
import 'package:codekameleon/data/javascript/javascript_tutorials.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import '../../constant/app_colors.dart';
import '../../model/language_model.dart';

const LanguageModel javaScriptLanguage = LanguageModel(
  name: "JavaScript",
  smallIcon: "assets/icons/javascript.png",
  largeIcon: "assets/icons/javascript_large.png",
  syntax: Syntax.JAVASCRIPT,
  color: AppColor.javascript,
  tutorials: jsTutorials,
  quizes: javaScriptQuizzes,
);

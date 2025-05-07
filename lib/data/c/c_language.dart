import 'package:codekameleon/data/c/c_quizes.dart';
import 'package:codekameleon/data/c/c_tutorials.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';


import '../../constant/app_colors.dart';
import '../../model/language_model.dart';


const LanguageModel cLanguage = LanguageModel(
  name: "C",
  smallIcon: "assets/icons/c.png",
  largeIcon: "assets/icons/c_large.png",
  syntax: Syntax.C,
  color: AppColor.c,
  tutorials: cTutorials,
  quizes: cQuizzes,
);
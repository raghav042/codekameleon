
import 'package:codekameleon/data/c++/cpp_tutorials.dart';
import 'package:codekameleon/data/c++/quizes.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import '../../constant/app_colors.dart';
import '../../model/language_model.dart';

const LanguageModel cppCourse = LanguageModel(
  name: "C++",
  smallIcon: "assets/icons/c++.png",
  largeIcon: "assets/icons/c++_large.png",
  syntax: Syntax.CPP,
  color: AppColor.cpp,
  tutorials: cppTutorials,
  quizes: cppQuizzes,
);

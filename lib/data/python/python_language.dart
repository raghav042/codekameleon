import 'package:codekameleon/data/python/python_tutorials.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import '../../constant/app_color.dart';
import '../../model/language_model.dart';
import 'python_quizes.dart';

const LanguageModel pythonLanguage = LanguageModel(
  name: "Python",
  smallIcon: "assets/icons/python.png",
  largeIcon: "assets/icons/python_large.png",
  syntax: Syntax.PYTHON,
  color: AppColor.python,
  tutorials: pythonTutorials,
  quizes: pythonQuizes,
);

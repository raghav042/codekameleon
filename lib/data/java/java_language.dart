import 'package:codekameleon/data/java/java_quizes.dart';
import 'package:codekameleon/data/java/java_tutorials.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import '../../constant/app_colors.dart';
import '../../model/language_model.dart';

const LanguageModel javaLanguage = LanguageModel(
  name: "Java",
  smallIcon: "assets/icons/java.png",
  largeIcon: "assets/icons/java_large.png",
  syntax: Syntax.JAVA,
  color: AppColor.java,
  tutorials: javaTutorials,
  quizes: javaQuizes,
);

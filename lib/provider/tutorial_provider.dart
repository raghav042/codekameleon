// import 'package:flutter/material.dart';
// import '../data/dart/dart_language.dart';
// import '../model/tutorial_model.dart';

// class TutorialProvider extends ChangeNotifier {
//   int currentIndex = 0;
//   TutorialModel get currentTutorial => dartLanguage.tutorials[currentIndex];

//   void updateIndex(int index) {
//     currentIndex = index;
//     notifyListeners();
//   }

//   void openTutorial({required BuildContext context, int? index}) {
//     updateIndex(index ?? currentIndex);

//     // if (MediaQuery.of(context).size.width < AppConstant.smallBreakPoint) {
//     //   Navigator.push(context, MaterialPageRoute(builder: (context) => const TutorialScreen()));
//     // }
//   }
// }

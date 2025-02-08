import 'package:flutter/material.dart';
import '../data/dart/tutorials.dart';
import '../model/tutorial_model.dart';

class TutorialProvider extends ChangeNotifier {
  int currentIndex = 0;
  TutorialModel get currentTutorial => dartTutorials.tutorials[currentIndex];

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void openTutorial({required BuildContext context, int? index}) {
    updateIndex(index ?? currentIndex);

    // if (MediaQuery.of(context).size.width < AppConstant.smallBreakPoint) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => const TutorialScreen()));
    // }
  }
}

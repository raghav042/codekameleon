import 'dart:developer';

import 'package:codekameleon/data/languages.dart';
import 'package:codekameleon/features/quiz/data/app_constants.dart';
import 'package:codekameleon/features/quiz/quiz_result.dart';
import 'package:codekameleon/helper/ui_helper.dart';
import 'package:codekameleon/main.dart';
import 'package:codekameleon/model/quiz_model.dart';
import 'package:codekameleon/preferences/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import '../../../model/language_model.dart';
import '../presentation/quiz_screen.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(const QuizState());

  final AppinioSwiperController swiperController = AppinioSwiperController();

  void updateIndex(int index) {
    emit(state.copyWith(currentIndex: index));
    emit(state.copyWith(mainIndex: index));
    print("the main index ${state.mainIndex}");
  }

  // void openPlayground({
  //   required BuildContext context,
  //   int? index,
  //   required LanguageModel language,
  // }) {
  //   updateIndex(index ?? state.currentIndex);
  //   if (MediaQuery.of(context).size.width < AppConstant.smallBreakPoint) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => QuizScreen(language: language),
  //       ),
  //     );
  //   }
  // }

  void submitQuiz(
      String quizId, List<QuizModel> quizList, LanguageModel language) {
    int totalScore = 0;
    Map<String, String> correctAnswers = {};

    for (int i = 0; i < quizList.length; i++) {
      final selected = state.selectedAnswers[i];
      final correctAnswer = quizList[i].options[quizList[i].answer - 1];
      log("the selected at index $i $selected and correct $correctAnswer");

      final isCorrect = selected == correctAnswer;
      correctAnswers[i.toString()] = selected ?? "";

      if (isCorrect) {
        totalScore += 1;
      }
    }
    log("the pref data$quizId and $correctAnswers");

    Preferences.saveQuizResult(quizId, correctAnswers);
    Navigator.pop(navigatorKey.currentContext!);
    Navigator.pop(navigatorKey.currentContext!);
    final quizResult = Preferences.getQuizResult(language.name);
    if (quizResult != null) {
      UiHelper.showGenericConfirmationDialog(
        context: navigatorKey.currentContext!,
        title: "Quiz Already Taken",
        message:
            "You've already completed this quiz. Would you like to view your result?",
        confirmText: "View Result",
        onConfirmed: () {
          Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (_) => QuizResultScreen(
                language: language,
                result: quizResult,
              ),
            ),
          );
        },
      );
    }
//  UiHelper.showGenericConfirmationDialog(s
    emit(state.copyWith(totalScore: totalScore, isSubmitted: true));
  }

  String? getSelectedAnswer() {
    return state.selectedAnswers[state.mainIndex];
  }

  void updateSelectedAnswer(String value) {
    final newSelectedAnswers = Map<int, String?>.from(state.selectedAnswers);
    newSelectedAnswers[state.mainIndex] = value;
    // log("the selected answer")
    emit(state.copyWith(selectedAnswers: newSelectedAnswers));
    log("the selected answer ${state.selectedAnswers}");
  }

  bool isBack() {
    return state.mainIndex > 0;
  }

  void goBack() {
    if (state.mainIndex > 0) {
      final newIndex = state.mainIndex - 1;
      swiperController.unswipe();
      emit(state.copyWith(mainIndex: newIndex));
    }
  }

  // void checkAnswer(int index) {
  //   final isCorrect =
  //       state.selectedAnswers[index] == questions[index]['correctAnswer'];
  //   final newScore = isCorrect ? state.totalScore + 1 : state.totalScore;

  //   if (state.mainIndex < questions.length - 1) {
  //     emit(state.copyWith(
  //       mainIndex: state.mainIndex + 1,
  //       totalScore: newScore,
  //     ));
  //   } else {
  //     emit(state.copyWith(totalScore: newScore));
  //   }
  // }
}

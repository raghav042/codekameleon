import 'dart:developer';

import 'package:codekameleon/features/quiz/data/app_constants.dart';
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

  void openPlayground({
    required BuildContext context,
    int? index,
    required LanguageModel language,
  }) {
    updateIndex(index ?? state.currentIndex);
    if (MediaQuery.of(context).size.width < AppConstant.smallBreakPoint) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(language: language),
        ),
      );
    }
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

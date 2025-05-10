import 'dart:developer';
import 'dart:ui';

import 'package:codekameleon/data/dart/dart_quizes.dart';
import 'package:codekameleon/helper/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:codekameleon/extension/context_extension.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_strings.dart';
import '../../helper/ui_helper.dart';
import '../../main.dart';
import '../../model/language_model.dart';
import '../../model/quiz_model.dart';
import '../../preferences/preferences.dart';
import '../../widgets/no_data_widget.dart';
import 'quiz_result.dart';

//TODO: simplify quiz screen code use provider and create class widgets

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.language});
  final LanguageModel language;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  int score = 0;
  bool isSubmitted = false;
  Map<int, String?> selectedAnswers = {};
  String image = AppHelper.getRandomImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black54, Colors.transparent],
            stops: [0.1, 0.4],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("${widget.language.name} Quiz"),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
          body: widget.language.quizes.isEmpty
              ? noDataWidget()
              : _buildQuizCard(),
        ),
      ),
    );
  }

  Widget noDataWidget() {
    return const NoDataWidget(
      imagePath: "assets/images/no_data.svg",
      title: AppStrings.noQuizFound,
    );
  }

  Widget quizSheet() {
    QuizModel quiz = widget.language.quizes[questionIndex];
    int index = questionIndex;
    ColorScheme colorScheme = context.colorScheme;
    selectedAnswers.containsKey(index);
    final selectedAnswer = selectedAnswers[questionIndex];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white30,
        border: Border.all(color: Colors.white30, width: 2),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: quiz.options.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final option = quiz.options[index];
                    final isSelected = selectedAnswer == option;
                    // final isCorrectAnswer = option == quiz.options[quiz.answer];

                    return GestureDetector(
                      onTap: () async {
                        // cubit.updateSelectedAnswer(option);
                        // log("the  actual ${dartQuizes[state.mainIndex].options[dartQuizes[state.mainIndex].answer]}");
                        // await Future.delayed(const Duration(seconds: 4));
                        // log("${quiz.options.indexOf(state.selectedAnswers[state.currentIndex].toString())} ₹{(index + 1) == quiz.answer)} ${quiz.answer} ${(index + 1)} and ${state.selectedAnswers}");
                        // log("the bool ${state.selectedAnswers}a nd $index");
                        if (!selectedAnswers.containsKey(questionIndex)) {
                          updateSelectedAnswer(option);
                        } else {
                          log("the  else $selectedAnswers");
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black54 : Colors.white70,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: colorScheme.surfaceContainerLow,
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                option,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (widget.language.quizes.isNotEmpty) buildNavButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: questionIndex > 0 ? goBack : null,
              child: const Text(AppStrings.previous),
            ),
          ),
          // if (state.mainIndex < widget.language.quizes.length - 1)
          SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: goNext,
              child: Text(questionIndex == widget.language.quizes.length - 1
                  ? AppStrings.submit
                  : AppStrings.next),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizCard() {
    QuizModel quiz = widget.language.quizes[questionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16,
          ),
          child: Text(
            quiz.question,
            style: GoogleFonts.quicksand(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        quizSheet(),
      ],
    );
  }

  void _showSubmitDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.submitQuiz),
        content: const Text(AppStrings.areYouSure),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pop();
              // log("the submit ${widget.language.name}");
              submitQuiz(widget.language.name, dartQuizes, widget.language);
            },
            child: const Text(AppStrings.submit),
          ),
        ],
      ),
    );
  }

  void updateIndex(int index) {
    setState(() {
      questionIndex = index;
    });
  }

  void submitQuiz(
      String quizId, List<QuizModel> quizList, LanguageModel language) {
    int totalScore = 0;
    Map<String, String> correctAnswers = {};

    for (int i = 0; i < quizList.length; i++) {
      final selected = selectedAnswers[i];
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
        title: AppStrings.quizAlreadyTaken,
        message: AppStrings.resultMessage,
        confirmText: AppStrings.viewResult,
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

    setState(() {
      totalScore = totalScore;
      isSubmitted = true;
    });
  }

  void updateSelectedAnswer(String value) {
    setState(() {
      selectedAnswers[questionIndex] = value;
    });

    log("the selected answer $selectedAnswers");
  }

  void goBack() {
    image = AppHelper.getRandomImage();
    if (questionIndex > 0) {
      setState(() {
        questionIndex = questionIndex - 1;
      });
    }
  }

  void goNext() {
    image = AppHelper.getRandomImage();
    if (questionIndex == widget.language.quizes.length - 1) {
      _showSubmitDialog();
    } else if (questionIndex < widget.language.quizes.length - 1) {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }
    // cubit.next();
  }
}

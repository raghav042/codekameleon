import 'dart:developer';

import 'package:codekameleon/data/dart/dart_quizes.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:codekameleon/extension/context_extension.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_strings.dart';
import '../../helper/snackbar_helper.dart';
import '../../helper/ui_helper.dart';
import '../../main.dart';
import '../../model/language_model.dart';
import '../../model/quiz_model.dart';
import '../../preferences/preferences.dart';
import '../../widgets/no_data_widget.dart';
import 'quiz_result.dart';


//TODO: simplify quiz screen code


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.language});
  final LanguageModel language;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final AppinioSwiperController swiperController = AppinioSwiperController();
  int questionIndex = 0;
  int score = 0;
  bool isSubmitted = false;
  Map<int, String?> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.language.name} Quiz"),
        // actions: [
        //   BlocBuilder<QuizCubit, QuizState>(
        //     builder: (context, state) => Padding(
        //       padding: const EdgeInsets.only(right: 16.0),
        //       child: Text(
        //         'Score: ${state.totalScore}',
        //         style: const TextStyle(fontSize: 18),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: widget.language.quizes.isEmpty
          ? const NoDataWidget(
              imagePath: "assets/images/no_data.svg",
              title: AppStrings.noQuizFound,
            )
          : _buildQuizContent(),
      bottomNavigationBar: widget.language.quizes.isEmpty
          ? null
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // if (cubit.isBack())
                  ElevatedButton(
                    onPressed: questionIndex > 0 ? goBack : null,
                    child: const Text(AppStrings.previous),
                  ),
                  // if (state.mainIndex < widget.language.quizes.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      if (questionIndex == widget.language.quizes.length - 1) {
                        _showSubmitDialog();
                      } else {
                        swiperController.swipeLeft();
                      }
                      // cubit.next();
                    },
                    // : null,
                    child: Text(
                        questionIndex == widget.language.quizes.length - 1
                            ? AppStrings.submit
                            : AppStrings.next),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildQuizContent() {
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppinioSwiper(
        controller: swiperController,
        cardCount: widget.language.quizes.length,
        onSwipeEnd: (previousIndex, targetIndex, activity) {
          if (targetIndex != -1) {
            updateIndex(targetIndex);
          }
        },
        cardBuilder: (context, index) {
          final quiz = widget.language.quizes[index];
          return _buildQuizCard(quiz, index, colorScheme);
        },
      ),
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
            //onPressed: () => Navigator.of(context).pop(),
            onPressed: (){
              Navigator.of(context).pop();
              SnackbarHelper.snackbarFunction(context, "Cancelled");
            },
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pop();
              // log("the submit ${widget.language.name}");
              submitQuiz(widget.language.name, dartQuizes, widget.language);
              SnackbarHelper.snackbarFunction(context, "Quiz submitted");
            },
            child: const Text(AppStrings.submit),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizCard(
    QuizModel quiz,
    int index,
    ColorScheme colorScheme,
  ) {
    final isSelected = selectedAnswers.containsKey(index);
    final selectedAnswer = selectedAnswers[questionIndex];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.5)
                : colorScheme.tertiary.withValues(alpha: 0.5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              quiz.question,
              style: GoogleFonts.quicksand(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: Center(
                  child:
                      _buildOptions(quiz, index, colorScheme, selectedAnswer))),
        ],
      ),
    );
  }

  Widget _buildOptions(QuizModel quiz, int quizIndex, ColorScheme colorScheme,
      String? selectedAnswer) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: quiz.options.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final option = quiz.options[index];
        final isSelected = selectedAnswer == option;
        // final isCorrectAnswer = option == quiz.options[quiz.answer];
        return InkWell(
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
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    selected: isSelected,
                    tileColor: colorScheme.surfaceContainerLowest,
                    selectedTileColor: colorScheme.primary,
                    selectedColor: colorScheme.onPrimary,
                    contentPadding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.surfaceContainerLow,
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(
                      option,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        // return Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 4.0),
        //   child: ListTile(
        //     onTap: () => cubit.updateSelectedAnswer(option),
        //     selected: isSelected,
        //     selectedColor: colorScheme.onPrimary,
        //     textColor: colorScheme.onPrimaryContainer,
        //     tileColor: quizIndex % 2 == 0
        //         ? colorScheme.primaryContainer
        //         : colorScheme.tertiaryContainer,
        //     selectedTileColor:
        //         quizIndex % 2 == 0 ? colorScheme.primary : colorScheme.tertiary,
        //     contentPadding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
        //     leading: CircleAvatar(
        //       backgroundColor: colorScheme.surfaceContainerLow,
        //       child: isSelected
        //           ? Icon(Icons.check, color: Colors.green.shade700)
        //           : Text('${index + 1}'),
        //     ),
        //     title: Text(option, style: const TextStyle(fontSize: 16)),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        // );
      },
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
    if (questionIndex > 0) {
      setState(() {
        questionIndex = questionIndex - 1;
      });
      swiperController.unswipe();
    }
  }
}

import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codekameleon/features/quiz/quiz_info.dart';
import 'package:codekameleon/helper/app_helper.dart';
import 'package:codekameleon/helper/quiz_helper.dart';
import 'package:codekameleon/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:codekameleon/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constant/app_strings.dart';
import '../../helper/snackbar_helper.dart';
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
    return QuizInfo(language: widget.language);

    Container(
      decoration: widget.language.quizes.isEmpty
          ? null
          : BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
      child: Container(
        decoration: widget.language.quizes.isEmpty
            ? null
            : const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.transparent],
                  stops: [0.1, 0.5],
                ),
              ),
        child: Scaffold(
          backgroundColor:
              widget.language.quizes.isEmpty ? null : Colors.transparent,
          appBar: AppBar(
            title: Text("${widget.language.name} Quiz"),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            actions: widget.language.quizes.isEmpty
                ? null
                : [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Question ${questionIndex + 1} of ${widget.language.quizes.length}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
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
        color: Colors.white54,
        border: Border.all(color: Colors.white60, width: 2),
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

                    return GestureDetector(
                      onTap: () async {
                        if (!selectedAnswers.containsKey(questionIndex)) {
                          updateSelectedAnswer(option);
                        } else {
                          log("the  else $selectedAnswers");
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black87 : Colors.white,
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
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
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
              onPressed: () {
                goNext();
              },
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
      mainAxisAlignment: MainAxisAlignment.start,
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
        const Spacer(),
        quizSheet(),
      ],
    );
  }

  void _showSubmitDialog(List<QuizModel> currentQuiz) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.submitQuiz),
        content: const Text(AppStrings.areYouSure),
        actions: [
          TextButton(
            //onPressed: () => Navigator.of(context).pop(),
            onPressed: () {
              Navigator.of(context).pop();
              SnackBarHelper.showSnackBar(context, "Cancelled");
            },
            child: const Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pop();
              // log("the submit ${widget.language.name}");
              submitQuiz(widget.language.name, currentQuiz, widget.language);
              SnackBarHelper.showSnackBar(context, "Quiz submitted");
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
      String quizId, List<QuizModel> quizList, LanguageModel language) async {
    int totalScore = 0;
    Map<String, String> correctAnswers = {};

    for (int i = 0; i < quizList.length; i++) {
      final selected = selectedAnswers[i];
      final correctAnswer = quizList[i].options[quizList[i].answer];
      log("the selected at index $i $selected and correct $correctAnswer");

      final isCorrect = selected == correctAnswer;
      correctAnswers[i.toString()] = selected ?? "";

      if (isCorrect) {
        totalScore += 1;
      }
    }
    log("the selected total answer $totalScore");
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      log("the user uid ${user.uid}");
      await updateUser(user: user, score: totalScore);
    }

    log("the pref data$quizId and $correctAnswers");

    Preferences.saveQuizResult(quizId, correctAnswers);
    Navigator.pop(navigatorKey.currentContext!);
    Navigator.pop(navigatorKey.currentContext!);
    final quizResult = Preferences.getQuizResult(language.name);
    if (quizResult != null) {
      UiHelper.showGenericConfirmationDialog(
        context: context,
        title: AppStrings.quizAlreadyTaken,
        message: AppStrings.resultMessage,
        confirmText: AppStrings.viewResult,
        onConfirmed: () {
          // loadAd();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => QuizResultScreen(
                language: language,
                result: quizResult,
              ),
            ),
          );
        },
        thirdOption: "Re-Attempt",
        thirdClick: () async {
          QuizHelper().quizReattempt(language); // await loadAd();
          // if (_rewardedAd != null) {
          //   _rewardedAd?.show(onUserEarnedReward:
          //       (AdWithoutView ad, RewardItem rewardItem) {
          //     log("the reward ${rewardItem.amount}");

          //     // Dispose ad after showing
          //     // _rewardedAd?.dispose();
          //     // _rewardedAd;

          //     // Start quiz
          //     // if(rewardItem.amount.i)
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) =>
          //             QuizScreen(language: languages[i]),
          //       ),
          //     );
          //   });
          // }
          // else {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) =>
          //           QuizScreen(language: languages[i]),
          //     ),
          //   );
          // }
        },

        // thirdClick: () async {
        //   // await loadAd();
        //   if (_rewardedAd != null) {
        //     _rewardedAd?.show(onUserEarnedReward:
        //         (AdWithoutView ad, RewardItem rewardItem) {
        //       log("the reward ${rewardItem.amount}");
        //       // Reward the user for watching an ad.
        //     });
        //   }
        // },
      );
    }

    // final quizResult = Preferences.getQuizResult(language.name);
    // if (quizResult != null) {
    //   UiHelper.showGenericConfirmationDialog(
    //     context: navigatorKey.currentContext!,
    //     title: AppStrings.quizAlreadyTaken,
    //     message: AppStrings.resultMessage,
    //     confirmText: AppStrings.viewResult,
    //     onConfirmed: () {
    //       Navigator.push(
    //         navigatorKey.currentContext!,
    //         MaterialPageRoute(
    //           builder: (_) => QuizResultScreen(
    //             language: language,
    //             result: quizResult,
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }

    setState(() {
      totalScore = totalScore;
      isSubmitted = true;
    });
  }

  Future<void> updateUser({required User user, required num score}) async {
    log("tge yodate $score");

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'points': context.read<UserProvider>().user.points + score})
        .then((value) => log("User Updated"))
        .catchError((error) => log("Failed to update user: $error"));
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
      _showSubmitDialog(widget.language.quizes);
    } else if (questionIndex < widget.language.quizes.length - 1) {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }
    // cubit.next();
  }


}



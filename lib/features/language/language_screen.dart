import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/features/quiz/quiz_result.dart';
import 'package:codekameleon/helper/ui_helper.dart';
import 'package:codekameleon/preferences/preferences.dart';
import 'package:codekameleon/helper/quiz_helper.dart';
import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';
import '../../model/language_model.dart';
import '../../widgets/no_data_widget.dart';
import '../quiz/quiz_screen.dart';
import '../tutorial/tutorial_list.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key, required this.language});
  final LanguageModel language;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar.large(
              excludeHeaderSemantics: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(language.smallIcon, height: 30),
                  const SizedBox(width: 10),
                  Text(language.name),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    final quizResult = Preferences.getQuizResult(language.name);
                    if (quizResult == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(language: language),
                        ),
                      );
                    } else {
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
                          QuizHelper()
                              .quizReattempt(language); // await loadAd();
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

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => QuizScreen(language: language)),
                    // );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: colorScheme.onSurface,
                    backgroundColor: colorScheme.tertiaryContainer,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sports_esports_outlined,
                        size: 22,
                        color: colorScheme.onSurface,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        AppStrings.quiz,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ];
        },
        body: language.tutorials.isNotEmpty
            ? TutorialList(language: language)
            : const NoDataWidget(
                imagePath: "assets/images/no_data.svg",
                title: AppStrings.noTutorialsFound,
              ),
      ),
    );
  }
}

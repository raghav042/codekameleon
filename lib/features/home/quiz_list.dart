import 'dart:developer';

import 'package:codekameleon/constant/app_ads.dart';
import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/features/quiz/quiz_result.dart';
import 'package:codekameleon/helper/ui_helper.dart';
import 'package:codekameleon/preferences/preferences.dart';
import 'package:codekameleon/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../constant/app_strings.dart';
import '../../data/languages.dart';
import '../../widgets/heading.dart';
import '../quiz/quiz_screen.dart';

class QuizList extends StatefulWidget {
  QuizList({super.key});

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  RewardedAd? _rewardedAd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadAd();
  }

  // Future<void> loadAd() async {
  //   RewardedAd.load(
  //       adUnitId: AppAds.rewardedAdUnitId,
  //       request: const AdRequest(),
  //       rewardedAdLoadCallback: RewardedAdLoadCallback(
  //         // Called when an ad is successfully received.
  //         onAdLoaded: (ad) {
  //           ad.fullScreenContentCallback = FullScreenContentCallback(
  //               // Called when the ad showed the full screen content.
  //               onAdShowedFullScreenContent: (ad) {},
  //               // Called when an impression occurs on the ad.
  //               onAdImpression: (ad) {},
  //               // Called when the ad failed to show full screen content.
  //               onAdFailedToShowFullScreenContent: (ad, err) {
  //                 // Dispose the ad here to free resources.
  //                 // ad.dispose();
  //               },
  //               // Called when the ad dismissed full screen content.
  //               onAdDismissedFullScreenContent: (ad) {
  //                 // Dispose the ad here to free resources.
  //                 // ad.dispose();
  //               },
  //               // Called when a click is recorded for an ad.
  //               onAdClicked: (ad) {});

  //           debugPrint('$ad loaded.');
  //           // Keep a reference to the ad so you can show it later.
  //           _rewardedAd = ad;
  //         },
  //         // Called when an ad request failed.
  //         onAdFailedToLoad: (LoadAdError error) {
  //           debugPrint('RewardedAd failed to load: $error');
  //         },
  //       ));
  //   await Future.delayed(Duration(milliseconds: 600));
  // }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: AppStrings.quizzes),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: languages.length,
            itemBuilder: (_, i) {
              return OutlinedButton(
                onPressed: () {
                  final quizResult =
                      Preferences.getQuizResult(languages[i].name);
                  if (quizResult == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QuizScreen(language: languages[i]),
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
                              language: languages[i],
                              result: quizResult,
                            ),
                          ),
                        );
                      },
                      thirdOption: "Re-Attempt",
                      thirdClick: () async {
                        QuizProvider()
                            .quizReattempt(languages[i]); // await loadAd();
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
                },
// onPressed: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               QuizScreen(language: languages[i])));
                // },
                style: OutlinedButton.styleFrom(
                  backgroundColor: colorScheme.surfaceContainerHigh,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      languages[i].smallIcon,
                      height: 45,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      languages[i].name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 15),
          ),
        ),
      ],
    );
  }
}

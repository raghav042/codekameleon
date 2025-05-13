import 'dart:developer';

import 'package:codekameleon/constant/app_ads.dart';
// import 'package:codekameleon/features/quiz/quiz_screen.dart';
// import 'package:codekameleon/main.dart';
import 'package:codekameleon/model/language_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:provider/provider.dart';

class QuizProvider {
  // QuizProvider._internal();
  // static final QuizProvider _instance = QuizProvider._internal();
  // factory QuizProvider() => _instance;

  RewardedAd? rewardedAd;
  Future<void> loadAd() async {
    RewardedAd.load(
        adUnitId: AppAds.rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  // Dispose the ad here to free resources.
                  // ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  // Dispose the ad here to free resources.
                  // ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            rewardedAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
    await Future.delayed(const Duration(milliseconds: 600));
  }

  Future<void> quizReattempt(LanguageModel language) async {
    await loadAd();
    if (rewardedAd != null) {
      rewardedAd?.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
        log("the reward ${rewardItem.amount}");

        // if(rewardItem.amount.i)
        // Navigator.push(
        //   navigatorKey.currentContext!,
        //   MaterialPageRoute(
        //     builder: (_) => QuizScreen(language: language),
        //   ),
        // );
      });
    }
  }
}

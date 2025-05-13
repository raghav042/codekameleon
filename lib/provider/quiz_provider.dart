import 'dart:developer';

import 'package:codekameleon/constant/app_ads.dart';
import 'package:codekameleon/main.dart';
import 'package:codekameleon/model/language_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../features/quiz/quiz_screen.dart' show QuizScreen;

class QuizHelper {
  RewardedAd? _rewardedAd;
  bool isAdLoading = false;

  Future<void> _loadAd(LanguageModel language) async {
    await RewardedAd.load(
      adUnitId: AppAds.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) async {
          log('RewardedAd loaded.');
          _rewardedAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (_) =>
                log("Ad showed full screen content."),
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              log("Ad dismissed.");
              isAdLoading = false;
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              log("Ad failed to show: $error");
            },
            onAdImpression: (_) => log("Ad impression recorded."),
            onAdClicked: (_) => log("Ad clicked."),
          );

          await ad.show(
            onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
              log("User earned reward: ${reward.amount} ${reward.type}");
              // onRewardEarned(); // Call the reward handler
            },
          );
          isAdLoading = false;
          if (!isAdLoading) {
            Navigator.push(
              navigatorKey.currentContext!,
              MaterialPageRoute(
                builder: (context) => QuizScreen(language: language),
              ),
            );
          }
        },
        onAdFailedToLoad: (LoadAdError error) {
          log('Failed to load RewardedAd: $error');
          isAdLoading = false;
        },
      ),
    );

    // Optional delay to allow ad to start (not strictly necessary)
  }

  Future<void> quizReattempt(LanguageModel language) async {
    try {
      // _rewardedAd?.dispose(); // Clean up any previous instance
      _rewardedAd = null;
      isAdLoading = true;
      await _loadAd(language);
      // await Future.delayed(const Duration(seconds: 2));
      // if (!isAdLoad/ing)

      // await _loadAd(onRewardEarned: onRewardEarned);
    } catch (e) {
      log("Error during quiz reattempt: $e");
    }
  }
}

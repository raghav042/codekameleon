import 'dart:developer';

import 'package:codekameleon/constant/app_ads.dart';
import 'package:codekameleon/main.dart';
import 'package:codekameleon/model/language_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

import '../features/quiz/quiz_screen.dart' show QuizScreen;

class QuizHelper {
  RewardedAd? _rewardedAd;
  bool isAdLoading = false;

  void _showLoaderDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: Lottie.asset(
              'assets/icons/lottieloader.json',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }

  void _hideLoaderDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<void> _loadAd(LanguageModel language) async {
    final context = navigatorKey.currentContext!;
    _showLoaderDialog(context);

    await RewardedAd.load(
      adUnitId: AppAds.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) async {
          log('RewardedAd loaded.');
          _rewardedAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (_) {
              log("Ad showed full screen content.");
            },
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              log("Ad dismissed.");
              isAdLoading = false;
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              log("Ad failed to show: $error");
              isAdLoading = false;
            },
            onAdImpression: (_) => log("Ad impression recorded."),
            onAdClicked: (_) => log("Ad clicked."),
          );

          await ad.show(
            onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
              log("User earned reward: ${reward.amount} ${reward.type}");
            },
          );
          isAdLoading = false;
          if (!isAdLoading) {
            _hideLoaderDialog(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(language: language),
              ),
            );
          }
        },
        onAdFailedToLoad: (LoadAdError error) {
          log('Failed to load RewardedAd: $error');
          isAdLoading = false;
          _hideLoaderDialog(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizScreen(language: language),
            ),
          );
        },
      ),
    );
  }

  Future<void> quizReattempt(LanguageModel language) async {
    try {
      _rewardedAd?.dispose();
      _rewardedAd = null;
      isAdLoading = true;
      await _loadAd(language);
    } catch (e) {
      log("Error during quiz reattempt: $e");
      if (isAdLoading && navigatorKey.currentContext != null) {
        _hideLoaderDialog(navigatorKey.currentContext!);
      }
      isAdLoading = false;
    }
  }
}

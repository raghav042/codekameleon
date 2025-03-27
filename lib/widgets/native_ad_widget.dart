import 'package:codekameleon/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constant/app_ads.dart';

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  double aspectRatio = 1;

  Future<void> loadNativeAd() async {
    final scheme = context.colorScheme;

    final style = NativeTemplateStyle(
      templateType: TemplateType.medium,
      mainBackgroundColor: scheme.surfaceContainerLowest,
      primaryTextStyle: NativeTemplateTextStyle(
        size: 16,
        textColor: scheme.onSurface,
        backgroundColor: scheme.surfaceContainerLowest,
      ),
      secondaryTextStyle: NativeTemplateTextStyle(
        size: 14,
        textColor: scheme.onSurface,
        backgroundColor: scheme.surfaceContainerLowest,
      ),
      tertiaryTextStyle: NativeTemplateTextStyle(
        size: 12,
        style: NativeTemplateFontStyle.bold,
        textColor: scheme.onSurface,
        backgroundColor: scheme.surfaceContainerLowest,
      ),
    );

    NativeAd(
      adUnitId: AppAds.nativeAdUnitId,
      request: const AdRequest(),
      nativeTemplateStyle: style,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _nativeAd = ad as NativeAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    super.dispose();
    _nativeAd?.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadNativeAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        width: double.maxFinite,
        color: context.colorScheme.surfaceContainerLowest,
        child: _nativeAd != null ? AdWidget(ad: _nativeAd!) : const SizedBox(),
      ),
    );
  }
}

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
    print("Loading Native Ad=================================\n\n");
    NativeAd(
      adUnitId: AppAds.nativeAdUnitId,
      request: const AdRequest(),
      nativeTemplateStyle:
          NativeTemplateStyle(templateType: TemplateType.medium),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _nativeAd = ad as NativeAd;
          });

          if (_nativeAd?.responseInfo != null &&
              _nativeAd?.responseInfo!.responseExtras != null &&
              _nativeAd!.responseInfo!.responseExtras
                  .containsKey('media_aspect_ratio')) {
            aspectRatio = double.parse(
                _nativeAd!.responseInfo!.responseExtras['media_aspect_ratio']);
          }
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();

    print("Native Ad completed================= $aspectRatio==================");
  }

  @override
  void dispose() {
    super.dispose();
    _nativeAd?.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadNativeAd();
  }

  @override
  Widget build(BuildContext context) {
    if (_nativeAd == null) return const SizedBox();
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: AdWidget(ad: _nativeAd!),
    );
  }
}

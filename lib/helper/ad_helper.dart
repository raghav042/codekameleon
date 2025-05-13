import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  const AdHelper._();

  static const int maxFailedLoadAttempts = 3;

  /// Add your device ad ids here to register as testing devices for admob
  static const String redmi12 = '78ab9fed-d842-45cf-b9f9-7b3f6572944b';
  static const String oppoA38 = '3138a461-7b0f-478c-a2b4-379be53e7471';
  static const String android10Emulator =
      "994f1f90-a2d6-47bd-942f-8060e48fd557";

  /// Initialize Google Mobile Ads SDK
  static Future<void> initGoogleMobileAds() async {
    await MobileAds.instance.initialize();
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
          testDeviceIds: [redmi12, oppoA38, android10Emulator]),
    );
  }
}

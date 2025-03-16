import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  const AdHelper._();

  static const String redmi12 = '78ab9fed-d842-45cf-b9f9-7b3f6572944b';
  static const int maxFailedLoadAttempts = 3;

  static Future<void> initGoogleMobileAds() async {
    print("initialize ads =======================================\n\n");
    await MobileAds.instance.initialize();
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: [redmi12]),
    );
    print("completed ads initialization =================================");
  }
}

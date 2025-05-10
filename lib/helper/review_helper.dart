import 'package:in_app_review/in_app_review.dart';

class InAppReviewRepository {
  final InAppReview _inAppReview = InAppReview.instance;

  Future<bool> isAvailable() async {
    return await _inAppReview.isAvailable();
  }

  Future<void> requestReview() async {
    try {
      if (await isAvailable()) {
        await _inAppReview.requestReview();
      } else {
        // if (kDebugMode) {
        // print("In-app review is not available on this platform.");
        // }
      }
    } catch (e) {
      // if (kD/ebugMode) {
      // print("Error requesting review: $e");
      // }
    }
  }

  Future<void> openStoreListing({String? appStoreId}) async {
    try {
      await _inAppReview.openStoreListing(appStoreId: appStoreId);
    } catch (e) {
      // if (kDebugMode) {
      // print("Error opening store listing: $e");
      // }
    }
  }
}

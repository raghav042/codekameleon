import 'dart:math';

import 'package:codekameleon/constant/app_images.dart';

class AppHelper {
  const AppHelper._();

  static String getRandomImage() {
    final random = Random();
    final randomIndex = random.nextInt(AppImages.images.length);
    return AppImages.images[randomIndex];
  }
}

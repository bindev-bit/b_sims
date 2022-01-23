import 'package:b_sims/src/screen/home/home_screen.dart';
import 'package:b_sims/src/screen/splash/splash_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'config/getx/onboarding_getx.dart';

class Root extends GetWidget<OnBoardingController> {
  const Root({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<OnBoardingController>().firstBuild.value
          ? const HomeScreen()
          : const SplashScreen(),
    );
  }
}

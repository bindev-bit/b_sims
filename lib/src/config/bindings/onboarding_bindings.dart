import 'package:b_sims/src/config/getx/auth_getx.dart';
import 'package:b_sims/src/config/getx/onboarding_getx.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

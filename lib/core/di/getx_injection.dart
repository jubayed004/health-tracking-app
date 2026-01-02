import 'package:get/get.dart';
import 'package:health_tracker_app/features/auth/controller/auth_controller.dart';
import 'package:health_tracker_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:health_tracker_app/share/controller/language_controller.dart';
import 'package:health_tracker_app/utils/common_controller/common_controller.dart';


void initGetx() {
  //Auth
  Get.lazyPut(() => LanguageController(), fenix: true);
  Get.lazyPut(() => AuthController(), fenix: true);
/*  Get.lazyPut(() => OtherController(), fenix: true);*/
  Get.lazyPut(() => OnboardingController(), fenix: true);
  Get.lazyPut(() => CommonController(), fenix: true);
}

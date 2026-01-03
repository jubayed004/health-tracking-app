import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/features/onboarding/model/onboarding_model.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';

class OnboardingController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: "assets/images/onboardingone.png",
      title: AppStrings.onboardingOne.tr,
      details: AppStrings.onboardingSubtitleOne.tr,
    ),

    OnboardingModel(
      image: "assets/images/onboardingtwo.png",
      title: AppStrings.onboardingTwo.tr,
      details: AppStrings.onboardingSubtitleTwo.tr,
    ),

    OnboardingModel(
      image: "assets/images/onboardingthree.png",
      title: AppStrings.onboardingThree.tr,
      details: AppStrings.onboardingSubtitleThree.tr,
    ),
  ];
  PageController pageController = PageController();

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

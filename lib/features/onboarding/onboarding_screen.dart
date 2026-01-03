import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/core/router/route_path.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/features/onboarding/model/onboarding_model.dart';
import 'package:health_tracker_app/features/onboarding/widgets/onboarding_page_card.dart';
import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
import 'package:health_tracker_app/share/widgets/custom_image/custom_image.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

import 'controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final _controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller.pageController,
                itemCount: _controller.onboardingList.length,
                onPageChanged: (index) {
                  _controller.currentIndex.value = index;
                },
                itemBuilder: (context, index) {
                  return OnboardingPageCard(
                    model: _controller.onboardingList[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      _controller.onboardingList.length,
                      (index) => buildDot(index, context),
                    ),
                  ),

                  Obx(() {
                    return CircularArrowButton(
                      onTap: () {
                        if (_controller.currentIndex.value <
                            _controller.onboardingList.length - 1) {
                          _controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          AppRouter.route.goNamed(RoutePath.loginScreen);
                        }
                      },
                      icon:
                          _controller.currentIndex.value ==
                              _controller.onboardingList.length - 1
                          ? Icons.check
                          : Icons.arrow_forward_ios_rounded,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6),
      child: Obx(() {
        final isActive = _controller.currentIndex.value == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 8,
          width: isActive ? 8 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Color(0xFF8C9EFF) // Light purple/blue as seen in design
                : AppColors.linesDarkColor,
          ),
        );
      }),
    );
  }
}

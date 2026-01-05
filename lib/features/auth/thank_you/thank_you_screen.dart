import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/core/custom_assets/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:health_tracker_app/core/router/route_path.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CircularArrowButton(onTap: () => AppRouter.route.pop()),
              ),
              const Gap(30),

              Expanded(flex: 3, child: Assets.images.wellcomelogo.image()),

              const Gap(20),

              Text(
                AppStrings.thankYou.tr,
                textAlign: TextAlign.center,
                style: context.headlineMedium,
              ),
              const Gap(16),
              Text(
                AppStrings.personalizeApp.tr,
                textAlign: TextAlign.center,
                style: context.bodyLarge,
              ),

              const Spacer(flex: 2),

              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  text: AppStrings.continueText.tr,
                  onTap: () {
                    context.pushNamed(RoutePath.subscriptionScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

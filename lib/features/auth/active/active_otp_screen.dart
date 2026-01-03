import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/core/router/route_path.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
import 'package:health_tracker_app/share/widgets/text_field/otp_text_field.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';
import 'package:pinput/pinput.dart';

class ActiveOtpScreen extends StatefulWidget {
  const ActiveOtpScreen({super.key});

  @override
  State<ActiveOtpScreen> createState() => _ActiveOtpScreenState();
}

class _ActiveOtpScreenState extends State<ActiveOtpScreen> {
  final verifyOtp = TextEditingController();

  @override
  void dispose() {
    verifyOtp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              CircularArrowButton(onTap: () => AppRouter.route.pop()),
              const Gap(32),

              // Title
              Text(
                AppStrings.enterYour6DigitCode.tr,
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackMainTextColor,
                ),
              ),
              const Gap(8),

              // Subtitle
              Text(
                AppStrings.enterOtpSubtitle.tr,
                style: context.bodyMedium.copyWith(
                  color: AppColors.grayTextSecondaryColor,
                ),
              ),
              const Gap(32),

              /// ---------- OTP INPUT ----------
              Align(
                alignment: Alignment.center,
                child: OtpTextField(controller: verifyOtp),
              ),

              const Gap(32),

              // Continue Button
              CustomButton(
                text: AppStrings.continueText.tr,
                onTap: () {
                  AppRouter.route.pushNamed(RoutePath.chooseGenderScreen);
                },
              ),
              const Gap(24),

              // Resend OTP
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "${AppStrings.haventReceivedOtp.tr} ",
                    style: context.bodyMedium.copyWith(
                      color: AppColors.blackMainTextColor,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.resendOtp.tr,
                        style: context.bodyMedium.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        // Recognizer can be added here
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_tracker_app/features/onboarding/model/onboarding_model.dart';
import 'package:health_tracker_app/share/widgets/custom_image/custom_image.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class OnboardingPageCard extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPageCard({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          // Title
          Text(
            model.title,
            style: context.titleLarge.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          // Subtitle
          Text(
            model.details,
            style: context.bodyMedium.copyWith(
              color: AppColors.grayTextSecondaryColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
          // Image
          Expanded(
            child: Center(
              child: CustomImage(
                imageSrc: model.image,
                boxFit: BoxFit
                    .contain, // Changed to contain to respect aspect ratio
              ),
            ),
          ),
        ],
      ),
    );
  }
}

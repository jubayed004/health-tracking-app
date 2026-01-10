import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/features/home/widgets/home_header.dart';
import 'package:health_tracker_app/features/home/widgets/health_tracking_card.dart';
import 'package:health_tracker_app/features/home/widgets/health_condition_section.dart';
import 'package:health_tracker_app/features/home/widgets/medication_section.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const HomeHeader(),
              Gap(24.h),

              // Health Tracking
              Text(
                AppStrings.healthTracking.tr,
                style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(16.h),
              const HealthTrackingCard(),
              Gap(24.h),

              // Health Condition
              Text(
                AppStrings.healthCondition.tr,
                style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(16.h),
              const HealthConditionSection(),
              Gap(24.h),

              // Medication
              Text(
                AppStrings.medication.tr,
                style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(16.h),
              const MedicationSection(),
            ],
          ),
        ),
      ),
    );
  }
}

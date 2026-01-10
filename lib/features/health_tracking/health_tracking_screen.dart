import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/features/health_tracking/widgets/blood_pressure_chart.dart';
import 'package:health_tracker_app/features/health_tracking/widgets/health_summary_card.dart';
import 'package:health_tracker_app/features/health_tracking/widgets/heart_rate_chart.dart';
import 'package:health_tracker_app/features/health_tracking/widgets/sleep_chart.dart';
import 'package:health_tracker_app/features/health_tracking/widgets/weight_chart.dart';
import 'package:health_tracker_app/share/widgets/button/circular_arrow_button.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';
import 'package:iconsax/iconsax.dart';

class HealthTrackingScreen extends StatelessWidget {
  const HealthTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularArrowButton(onTap: () => AppRouter.route.pop()),
                    Text(
                      AppStrings.healthTracking.tr,
                      style: context.titleLarge,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Icon(Iconsax.calendar_1, size: 24),
                    ),
                  ],
                ),
              ),

              // Summary Card
              const HealthSummaryCard(),
              Gap(24.h),

              // Heart Rate Chart
              const HeartRateChart(),
              Gap(24.h),

              // Sleep Chart
              const SleepChart(),
              Gap(24.h),

              // Blood Pressure Chart
              const BloodPressureChart(),
              Gap(24.h),

              // Weight Chart
              const WeightChart(),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}

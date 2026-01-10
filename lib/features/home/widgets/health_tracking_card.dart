import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:health_tracker_app/core/router/route_path.dart';
import 'package:health_tracker_app/core/router/routes.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';
import 'package:iconsax/iconsax.dart';

class HealthTrackingCard extends StatelessWidget {
  const HealthTrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.route.pushNamed(RoutePath.healthTrackingScreen);
      },
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            // Circular Tracker
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 120.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer Ring (Blood Pressure - Red)
                    SizedBox(
                      width: 120.h,
                      height: 120.h,
                      child: CircularProgressIndicator(
                        value: 0.79,
                        strokeWidth: 8,
                        backgroundColor: const Color(0xFFFFEAEA),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFFFF6B6B),
                        ),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    // Middle Ring (Sleep - Green)
                    SizedBox(
                      width: 90.h,
                      height: 90.h,
                      child: CircularProgressIndicator(
                        value: 0.60,
                        strokeWidth: 8,
                        backgroundColor: const Color(0xFFEAFFEA),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFF4ADE80),
                        ),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    // Inner Ring (Heart Rate - Blue)
                    SizedBox(
                      width: 60.h,
                      height: 60.h,
                      child: CircularProgressIndicator(
                        value: 0.50,
                        strokeWidth: 8,
                        backgroundColor: const Color(0xFFEAF2FF),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFF6B9DF8),
                        ),
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20.w),
            // Stats
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatRow(
                    context,
                    icon: Iconsax.heart,
                    iconColor: const Color(0xFF6B9DF8),
                    iconBg: const Color(0xFFEAF2FF),
                    value: "120",
                    unit: "/130 ${AppStrings.heartRate.tr}",
                  ),
                  Gap(12.h),
                  _buildStatRow(
                    context,
                    icon: Icons.bed_outlined, // Bed icon for sleep
                    iconColor: Colors.green,
                    iconBg: const Color(0xFFEAFFEA),
                    value: "7 H",
                    unit: "/8 ${AppStrings.hSleep.tr}",
                  ),
                  Gap(12.h),
                  _buildStatRow(
                    context,
                    icon: Icons.water_drop_outlined, // Better icon for BP?
                    iconColor: const Color(0xFFFF6B6B),
                    iconBg: const Color(0xFFFFEAEA),
                    value: "79",
                    unit: "/64 ${AppStrings.bloodPressure.tr}",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String value,
    required String unit,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor, size: 16.sp),
        ),
        Gap(10.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: value,
              style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: " $unit",
                  style: context.bodySmall.copyWith(
                    color: AppColors.grayTertiaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

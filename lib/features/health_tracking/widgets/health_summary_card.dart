import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_tracker_app/share/widgets/button/custom_button.dart';
import 'package:health_tracker_app/share/widgets/dialog/custom_dialog.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/color/app_colors.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';
import 'package:iconsax/iconsax.dart';
import 'package:health_tracker_app/share/widgets/text_field/custom_text_field.dart';

class HealthSummaryCard extends StatelessWidget {
  const HealthSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                    icon: Icons.bed_outlined, // Bed icon
                    iconColor: Colors.green,
                    iconBg: const Color(0xFFEAFFEA),
                    value: "7h",
                    unit:
                        " /8h ${AppStrings.hSleep.tr.replaceAll('h', '').trim()}", // Cleaning string for better fit
                  ),
                  Gap(12.h),
                  _buildStatRow(
                    context,
                    icon: Icons.water_drop_outlined,
                    iconColor: const Color(0xFFFF6B6B),
                    iconBg: const Color(0xFFFFEAEA),
                    value: "79",
                    unit: "/64 ${AppStrings.bloodPressure.tr}",
                  ),
                  Gap(12.h),
                  _buildStatRow(
                    context,
                    icon: Icons.monitor_weight_outlined,
                    iconColor: Colors.orange,
                    iconBg: const Color(0xFFFFF2D0), // Light orange
                    value: "54lb",
                    unit: "/ 56lb ${AppStrings.weight.tr}",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AppDialog.show(
                        context: context,
                        type: AppDialogType.custom,
                        padding: EdgeInsets.zero,
                        actions: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                children: [
                                  Gap(24.h),
                                  CustomTextField(
                                    title: AppStrings.heartRate.tr,
                                    hintText: AppStrings.heartRate.tr,
                                  ),
                                  Gap(12.h),
                                  CustomTextField(
                                    title: "Sleeping Hours",
                                    hintText: "Sleeping Hours",
                                  ),
                                  Gap(12.h),
                                  CustomTextField(
                                    title: AppStrings.bloodPressure.tr,
                                    hintText: AppStrings.bloodPressure.tr,
                                  ),
                                  Gap(12.h),
                                  CustomTextField(
                                    title: AppStrings.weight.tr,
                                    hintText: AppStrings.weight.tr,
                                  ),
                                  Gap(24.h),
                                  CustomButton(
                                    text: AppStrings.update.tr,
                                    onTap: () => Navigator.pop(context),
                                  ),
                                  Gap(24.h),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B9DFF),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 10.h,
                      ),
                      minimumSize: Size.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Text(
                      AppStrings.update.tr,
                      style: context.bodyMedium.copyWith(color: Colors.white),
                    ),
                  ),
                  Gap(30.h),
                  Text(
                    "Last Update\n10:30\n12 Jan 25",
                    textAlign: TextAlign.right,
                    style: context.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ],
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
        RichText(
          text: TextSpan(
            text: value,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: " $unit",
                style: context.bodySmall.copyWith(
                  color: AppColors.grayTertiaryTextColor,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

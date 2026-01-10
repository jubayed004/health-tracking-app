import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class HealthConditionSection extends StatelessWidget {
  const HealthConditionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Wrap(
        spacing: 12.w,
        runSpacing: 12.h,
        children: [
          _buildChip(context, "Diabetes".tr),
          _buildChip(context, "Heart Disease".tr),
          _buildChip(context, "Arthritis".tr),
          _buildChip(context, "Asthma".tr),
          _buildChip(context, "Hypertension".tr),
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFF8B9DFF),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Text(
        label.tr,
        style: context.bodyMedium.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

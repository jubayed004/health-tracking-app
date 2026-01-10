import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:health_tracker_app/utils/extension/base_extension.dart';

class MedicationSection extends StatelessWidget {
  const MedicationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMedicationCard(
          context,
          title: AppStrings.diuretics.tr,
          frequency: "3 Times Day",
          doses: [
            {"label": AppStrings.firstDose.tr, "time": "8:30 am"},
            {"label": AppStrings.secondDose.tr, "time": "2:30 pm"},
            {"label": "3rd Dose", "time": "8:30 pm"},
          ],
        ),
        Gap(12.h),
        _buildMedicationCard(
          context,
          title: AppStrings.aceInhibitors.tr,
          frequency: "4 Times Day",
          doses: [
            {"label": AppStrings.firstDose.tr, "time": "8:30 am"},
            {"label": AppStrings.secondDose.tr, "time": "2:30 pm"},
            {"label": "3rd Dose", "time": "8:30 pm"},
            {"label": "4th Dose", "time": "2:30 am"},
          ],
        ),
        Gap(12.h),
        _buildMedicationCard(
          context,
          title: AppStrings.calciumChannelBlockers.tr,
          frequency: "2 Times Day",
          doses: [
            {"label": AppStrings.firstDose.tr, "time": "8:30 am"},
            {"label": "3rd Dose", "time": "8:30 pm"},
            {"label": "4th Dose", "time": "2:30 am"},
          ],
        ),
      ],
    );
  }

  Widget _buildMedicationCard(
    BuildContext context, {
    required String title,
    required String frequency,
    required List<Map<String, String>> doses,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.tr,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                frequency,
                style: context.bodySmall.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Gap(16.h),
          SingleChildScrollView(
            // Allow horizontal scroll if many doses
            scrollDirection: Axis.horizontal,
            child: Row(
              children: doses.map((dose) {
                return Container(
                  width: 100.w,
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        dose["label"]!,
                        style: context.bodySmall.copyWith(color: Colors.grey),
                      ),
                      Gap(4.h),
                      Text(
                        dose["time"]!,
                        style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

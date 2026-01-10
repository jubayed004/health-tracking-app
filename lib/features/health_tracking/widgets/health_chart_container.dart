import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:health_tracker_app/utils/extension/base_extension.dart';

class HealthChartContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final String? subtitle;

  const HealthChartContainer({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
          ),
          if (subtitle != null) ...[
            Gap(4.h),
            Text(
              subtitle!,
              style: context.bodySmall.copyWith(color: Colors.grey),
            ),
          ],
          Gap(24.h),
          child,
        ],
      ),
    );
  }
}

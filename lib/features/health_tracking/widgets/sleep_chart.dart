import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_tracker_app/features/health_tracking/widgets/health_chart_container.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

import 'package:health_tracker_app/utils/extension/base_extension.dart';

class SleepChart extends StatelessWidget {
  const SleepChart({super.key});

  @override
  Widget build(BuildContext context) {
    return HealthChartContainer(
      title: AppStrings.sleepTime.tr,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    if (value % 2 == 0) {
                      return Text(
                        "${value.toInt()}h",
                        style: context.labelSmall.copyWith(color: Colors.grey),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const days = [
                      'Sat',
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                    ];
                    if (value.toInt() >= 0 && value.toInt() < days.length) {
                      return Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          days[value.toInt()],
                          style: context.labelSmall.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            barGroups: [
              _makeGroupData(0, 5),
              _makeGroupData(1, 8),
              _makeGroupData(2, 9),
              _makeGroupData(3, 5),
              _makeGroupData(4, 7),
              _makeGroupData(5, 8.5),
              _makeGroupData(6, 7.5),
            ],
            maxY: 12,
          ),
        ),
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: const Color(0xFF8B9DFF),
          width: 28.w,
          borderRadius: BorderRadius.circular(8.r),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 12, // Max height
            color: const Color(0xFFEBEBEB),
          ),
        ),
      ],
    );
  }
}

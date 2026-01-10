import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_tracker_app/features/health_tracking/widgets/health_chart_container.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

import 'package:health_tracker_app/utils/extension/base_extension.dart';

class BloodPressureChart extends StatelessWidget {
  const BloodPressureChart({super.key});

  @override
  Widget build(BuildContext context) {
    return HealthChartContainer(
      title: AppStrings.bloodPressure.tr,
      subtitle: "Millimeters Of Mercury",
      child: AspectRatio(
        aspectRatio: 1.5,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    if (value % 20 == 0) {
                      return Text(
                        value.toInt().toString(),
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
            minX: 0,
            maxX: 6,
            minY: 40,
            maxY: 160,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 110),
                  FlSpot(1, 100),
                  FlSpot(2, 120), // Peak
                  FlSpot(3, 95),
                  FlSpot(4, 110),
                  FlSpot(5, 90),
                  FlSpot(6, 115),
                ],
                isCurved: true,
                color: const Color(0xFF8B9DFF),
                barWidth: 6,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  checkToShowDot: (spot, barData) =>
                      spot.y == 120 && spot.x == 2, // Only show peak dot
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                        radius: 6,
                        color: Colors.white,
                        strokeWidth: 3,
                        strokeColor: const Color(0xFF8B9DFF),
                      ),
                ),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (touchedSpot) => const Color(0xFF8B9DFF),
                tooltipPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                tooltipMargin: 8,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((LineBarSpot touchedSpot) {
                    return LineTooltipItem(
                      "${touchedSpot.y.toInt()}mmHg",
                      context.labelSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

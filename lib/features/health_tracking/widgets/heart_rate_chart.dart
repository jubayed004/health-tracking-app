import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_tracker_app/features/health_tracking/widgets/health_chart_container.dart';
import 'package:health_tracker_app/utils/app_strings/app_strings.dart';
import 'package:get/get.dart';

import 'package:health_tracker_app/utils/extension/base_extension.dart';

class HeartRateChart extends StatelessWidget {
  const HeartRateChart({super.key});

  @override
  Widget build(BuildContext context) {
    return HealthChartContainer(
      title: AppStrings.heartRate.tr,
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
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
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
            minY: 20,
            maxY: 120,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 80),
                  FlSpot(1, 70),
                  FlSpot(2, 90), // Peak
                  FlSpot(3, 75),
                  FlSpot(4, 90),
                  FlSpot(5, 75),
                  FlSpot(6, 85),
                ],
                isCurved: true,
                color: const Color(0xFF8B9DFF),
                barWidth: 6,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  checkToShowDot: (spot, barData) =>
                      spot.y == 90 && spot.x == 2, // Only show peak dot
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
                      "${touchedSpot.y.toInt()} BPM",
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

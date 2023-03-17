import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mica/common/responsive/responsive.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';

class CardInfoChart extends StatefulWidget {
  const CardInfoChart({
    super.key,
    this.isMonthly = true,
  });

  final bool isMonthly;

  @override
  State<CardInfoChart> createState() => _CardInfoChartState();
}

class _CardInfoChartState extends State<CardInfoChart> {
  List<FlSpot> monthly = const [
    FlSpot(0, 45),
    FlSpot(1, 66),
    FlSpot(3, 41),
    FlSpot(5, 89),
    FlSpot(7, 25),
    FlSpot(9, 44),
    FlSpot(11, 9),
    FlSpot(13, 54),
  ];

  List<FlSpot> year = const [
    FlSpot(0, 35),
    FlSpot(1, 44),
    FlSpot(3, 9),
    FlSpot(5, 54),
    FlSpot(7, 45),
    FlSpot(9, 66),
    FlSpot(11, 41),
    FlSpot(13, 69),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 6 : 2,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              fitInsideHorizontally: true,
              tooltipBgColor: const Color(0xCC1e3346),
              getTooltipItems: (touchItem) {
                return touchItem
                    .map(
                      (e) => LineTooltipItem(
                        'Total Order ${e.y.toInt()}',
                        AppTextStyle.f14W400White,
                      ),
                    )
                    .toList();
              },
            ),
            getTouchedSpotIndicator: (barData, indicators) {
              return indicators.map(
                (e) {
                  final line = FlLine(
                      color: AppColors.primaryColor,
                      strokeWidth: 1,
                      dashArray: [2, 3]);
                  return TouchedSpotIndicatorData(
                    line,
                    FlDotData(show: true),
                  );
                },
              ).toList();
            },
            getTouchLineEnd: (barData, spotIndex) {
              return double.infinity;
            },
          ),
          titlesData: FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            show: false,
            drawVerticalLine: false,
            horizontalInterval: 1,
            verticalInterval: 1,
          ),
          lineBarsData: [
            LineChartBarData(
              color: AppColors.primaryColor,
              barWidth: 3,
              isCurved: true,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              spots: widget.isMonthly ? monthly : year,
            )
          ],
        ),
      ),
    );
  }
}

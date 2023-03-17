import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';

class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(show: false),
        lineBarsData: lineBarsData1,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          fitInsideHorizontally: true,
          tooltipBgColor: const Color(0xCC1e3346),
          getTooltipItems: (touchItem) {
            return touchItem
                .map(
                  (e) => LineTooltipItem(
                    'Ticket ${e.y.toInt()}',
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
                dashArray: [2, 3],
              );
              return TouchedSpotIndicatorData(
                line,
                FlDotData(
                  show: true,
                  getDotPainter: (p0, p1, p2, p3) {
                    return FlDotCirclePainter(
                      color: AppColors.primaryColor,
                      strokeColor: AppColors.primaryColor,
                      radius: 5
                    );
                  },
                ),
              );
            },
          ).toList();
        },
        getTouchLineEnd: (barData, spotIndex) {
          return double.infinity;
        },
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  FlGridData get gridData => FlGridData(show: false);

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: AppColors.purple,
        barWidth: 1.2,
        isStrokeCapRound: false,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
            show: true,
            applyCutOffY: false,
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              AppColors.purple200,
              AppColors.purple100,
            ])),
        spots: const [
          FlSpot(1, 5),
          FlSpot(2, 15),
          FlSpot(4, 10),
          FlSpot(6, 50),
          FlSpot(8, 30),
          FlSpot(10, 40),
          FlSpot(12, 50),
          FlSpot(13, 40),
        ],
      );
}

class PopularStockChart extends StatefulWidget {
  const PopularStockChart({super.key});

  @override
  State<StatefulWidget> createState() => PopularStockChartState();
}

class PopularStockChartState extends State<PopularStockChart> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: defaultRadius,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: defaultRadius,
          color: AppColors.purple100,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bajaj finery',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.purple,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '10% Profit',
                              style: AppTextStyle.f14W400BlackText
                                  .copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          '\$1839.00',
                          style: AppTextStyle.f14W600RobotoBlackBoldText,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: _LineChart(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

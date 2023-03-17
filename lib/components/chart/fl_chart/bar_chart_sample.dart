import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/responsive/responsive.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';

class BarChartSample4 extends StatefulWidget {
  const BarChartSample4({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample4State();
}

class BarChartSample4State extends State<BarChartSample4> {
  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Okt';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Des';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;

    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 90:
        text = '90';
        break;
      case 180:
        text = '180';
        break;
      case 270:
        text = '270';
        break;
      case 360:
        text = '360';
        break;
      default:
        text = '';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  BarTouchTooltipData get barTouchToolTipData => BarTouchTooltipData(
        tooltipRoundedRadius: 8,
        tooltipBorder: BorderSide(
          color: AppColors.borderColor,
        ),
        fitInsideHorizontally: true,
        fitInsideVertically: true,
        tooltipBgColor: const Color(0xCC1e3346),
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String text;
          switch (group.x.toInt()) {
            case 0:
              text = 'Jan';
              break;
            case 1:
              text = 'Feb';
              break;
            case 2:
              text = 'Mar';
              break;
            case 3:
              text = 'Apr';
              break;
            case 4:
              text = 'May';
              break;
            case 5:
              text = 'Jun';
              break;
            case 6:
              text = 'Jul';
              break;
            case 7:
              text = 'Aug';
              break;
            case 8:
              text = 'Sep';
              break;
            case 9:
              text = 'Okt';
              break;
            case 10:
              text = 'Nov';
              break;
            case 11:
              text = 'Des';
              break;
            default:
              text = '';
              break;
          }
          return BarTooltipItem(
            '${text.toString()}\n',
            textAlign: TextAlign.start,
            AppTextStyle.f14W400White,
            children: group.barRods.map((e) {
              return TextSpan(
                children: e.rodStackItems.asMap().entries.map((entry) {
                  String label = '';

                  switch (entry.key) {
                    case 0:
                      label = 'Investment';
                      break;
                    case 1:
                      label = 'Loss';
                      break;
                    case 2:
                      label = 'Profit';
                      break;
                    case 3:
                      label = 'Maintenance';
                      break;
                    default:
                      label = '';
                      break;
                  }
                  return TextSpan(children: [
                    TextSpan(
                      text:
                          '$label : ${entry.value.toY.toInt() - entry.value.fromY.toInt()}\n',
                      style: AppTextStyle.f12W400Black.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ]);
                }).toList(),
              );
            }).toList(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.6,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return BarChart(
                  BarChartData(
                    maxY: 370,
                    minY: -10,
                    alignment: BarChartAlignment.center,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: barTouchToolTipData,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          getTitlesWidget: bottomTitles,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          interval: 90,
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: leftTitles,
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 90,
                      checkToShowHorizontalLine: (value) => value % 90 == 0,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: AppColors.borderColor.withOpacity(0.1),
                        strokeWidth: 1,
                      ),
                      drawVerticalLine: false,
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: getData(!Responsive.isMobile(context) ? 25 : 10, Responsive.isMobile(context) ? 1 : 10),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: defaultRadius,
                color: AppColors.blue30,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Investment',
              style: AppTextStyle.f12W400Black,
            ),
            const SizedBox(width: defaultPadding),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: defaultRadius,
                color: AppColors.blue50,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Loss',
              style: AppTextStyle.f12W400Black,
            ),
            const SizedBox(width: defaultPadding),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: defaultRadius,
                color: AppColors.purple,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Profit',
              style: AppTextStyle.f12W400Black,
            ),
            const SizedBox(width: defaultPadding),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: defaultRadius,
                color: AppColors.purple100,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Maintenance',
              style: AppTextStyle.f12W400Black,
            ),
          ],
        )
      ],
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      // Jan
      BarChartGroupData(
        showingTooltipIndicators: [32, 70, 100],
        x: 0,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 100,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 35, AppColors.blue30),
              BarChartRodStackItem(35, 70, AppColors.blue50),
              BarChartRodStackItem(70, 100, AppColors.purple),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Feb
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 280,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 125, AppColors.blue30),
              BarChartRodStackItem(125, 140, AppColors.blue50),
              BarChartRodStackItem(140, 285, AppColors.purple),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Mar
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 160,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 35, AppColors.blue30),
              BarChartRodStackItem(35, 50, AppColors.blue50),
              BarChartRodStackItem(50, 85, AppColors.purple),
              BarChartRodStackItem(85, 160, AppColors.purple100),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Apr
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 105,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 35, AppColors.blue30),
              BarChartRodStackItem(35, 70, AppColors.blue50),
              BarChartRodStackItem(70, 105, AppColors.purple),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // May
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 120,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 35, AppColors.blue30),
              BarChartRodStackItem(35, 100, AppColors.blue50),
              BarChartRodStackItem(100, 120, AppColors.purple),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Jun
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 340,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 80, AppColors.blue30),
              BarChartRodStackItem(80, 120, AppColors.blue50),
              BarChartRodStackItem(120, 225, AppColors.purple),
              BarChartRodStackItem(225, 340, AppColors.purple100),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Jan
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 100,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 35, AppColors.blue30),
              BarChartRodStackItem(35, 70, AppColors.blue50),
              BarChartRodStackItem(70, 100, AppColors.purple),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Feb
      BarChartGroupData(
        x: 7,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 280,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 125, AppColors.blue30),
              BarChartRodStackItem(125, 140, AppColors.blue50),
              BarChartRodStackItem(140, 285, AppColors.purple),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Mar
      BarChartGroupData(
        x: 8,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 160,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 35, AppColors.blue30),
              BarChartRodStackItem(35, 50, AppColors.blue50),
              BarChartRodStackItem(50, 85, AppColors.purple),
              BarChartRodStackItem(85, 160, AppColors.purple100),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Apr
      BarChartGroupData(
        x: 9,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 105,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 35, AppColors.blue30),
              BarChartRodStackItem(35, 70, AppColors.blue50),
              BarChartRodStackItem(70, 105, AppColors.purple),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // May
      BarChartGroupData(
        x: 10,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 120,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 35, AppColors.blue30),
              BarChartRodStackItem(35, 100, AppColors.blue50),
              BarChartRodStackItem(100, 120, AppColors.purple),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      // Jun
      BarChartGroupData(
        x: 11,
        barRods: [
          BarChartRodData(
            width: barsWidth,
            toY: 340,
            borderSide: BorderSide.none,
            rodStackItems: [
              BarChartRodStackItem(0, 80, AppColors.blue30),
              BarChartRodStackItem(80, 120, AppColors.blue50),
              BarChartRodStackItem(120, 225, AppColors.purple),
              BarChartRodStackItem(225, 340, AppColors.purple100),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
    ];
  }
}

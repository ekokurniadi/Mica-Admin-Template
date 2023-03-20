import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/extensions/string_title.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';
import 'package:mica/components/chart/fl_chart/bar_chart_sample.dart';

class DashboardBarChart extends StatefulWidget {
  const DashboardBarChart({super.key});

  @override
  State<DashboardBarChart> createState() => _DashboardBarChartState();
}

class _DashboardBarChartState extends State<DashboardBarChart> {
  String dropDownValue = 'today';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: defaultRadius,
        color: AppColors.primaryColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Growth',
                    style: AppTextStyle.f12W400Black,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$2,324.00',
                    style: AppTextStyle.f14W600RobotoBlackBoldText,
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(
                  defaultPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1,
                  ),
                  borderRadius: defaultRadius,
                ),
                child: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'today',
                      child: Text(
                        'Today',
                        style: AppTextStyle.f14W600RobotoBlackBoldText,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'this month',
                      child: Text(
                        'Month',
                        style: AppTextStyle.f14W600RobotoBlackBoldText,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'this year',
                      child: Text(
                        'Year',
                        style: AppTextStyle.f14W600RobotoBlackBoldText,
                      ),
                    ),
                  ],
                  child: Row(
                    children: [
                      Text(
                        dropDownValue.toTitleCase(),
                        style: AppTextStyle.f14W600RobotoBlackBoldText,
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onSelected: (value) {
                    setState(() {
                      dropDownValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding + 2),
          const BarChartSample4(),
        ],
      ),
    );
  }
}

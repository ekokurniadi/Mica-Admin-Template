import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';
import 'package:mica/components/button/popup_menu_button.dart';
import 'package:mica/components/chart/fl_chart/popular_stock_chart.dart';
import 'package:mica/screens/main_screen/widgets/popular_stock_list_item.dart';

class PopularStock extends StatelessWidget {
  const PopularStock({super.key});

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
              Text(
                'Popular Stock',
                style: AppTextStyle.f14W600RobotoBlackBoldText,
              ),
              SimplePopUpMenuButton(
                backgroundColor: AppColors.primaryColor,
                iconColor: AppColors.blue100,
                icon: Icons.more_horiz,
                toolTip: '',
                offset: const Offset(0, 10),
                onSelected: (value) {},
                children: const [PopupMenuItem(value: '', child: Text(''))],
              )
            ],
          ),
          const PopularStockChart(),
          const PopularStockListItem(
            isUp: true,
            title: 'Bajaj Finery',
            percentage: '10% Profit',
            amount: '2893.00',
          ),
          const PopularStockListItem(
            isUp: false,
            title: 'TTML',
            percentage: '10% loss',
            amount: '100.00',
          ),
          const PopularStockListItem(
            isUp: true,
            title: 'Bajaj Finery',
            percentage: '10% Profit',
            amount: '2893.00',
          ),
          const PopularStockListItem(
            isUp: false,
            title: 'TTML',
            percentage: '10% loss',
            amount: '100.00',
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';

class PopularStockListItem extends StatelessWidget {
  const PopularStockListItem({
    super.key,
    required this.isUp,
    required this.title,
    required this.percentage,
    required this.amount,
  });

  final bool isUp;
  final String title;
  final String percentage;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding -2),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grayColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.f14W600RobotoBlackBoldText.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                percentage,
                style: AppTextStyle.f14W600RobotoBlackBoldText.copyWith(
                  fontSize: 12,
                  color: isUp ? AppColors.green : AppColors.orange,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '\$$amount',
                style: AppTextStyle.f14W600RobotoBlackBoldText.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: defaultRadius,
                  color: isUp ? AppColors.green100 : AppColors.orange100,
                ),
                child: Icon(
                  isUp ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: isUp ? AppColors.green : AppColors.orange,
                  size: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

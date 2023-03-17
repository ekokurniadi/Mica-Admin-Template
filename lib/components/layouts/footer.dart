import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        border: Border(
          top: BorderSide(
            color: AppColors.grayColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Copyright \u00a9 2023. All right reserved, ',
            style: AppTextStyle.f13W400Black,
          ),
          Text(
            'made with',
            style: AppTextStyle.f13W400Black,
          ),
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          Text(
            ' by Eko Kurniadi',
            style: AppTextStyle.f13W400Black,
          ),
        ],
      ),
    );
  }
}

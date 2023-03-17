import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';
import 'package:mica/components/button/simple_button.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyle.f14W600BlackBold,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.borderColor,
            size: 20,
          ),
          prefixStyle: TextStyle(
            color: AppColors.borderColor,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SimpleButton(
              backgroundColor: AppColors.purple100,
              svgIcon: 'assets/images/svg/ic_search_filter.svg',
              iconColor: AppColors.purple,
              onPress: () {},
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 22),
          hintText: 'Search...',
          hintStyle: AppTextStyle.f14W400Black,
          border: OutlineInputBorder(
            borderRadius: defaultRadius,
            borderSide: BorderSide(
              color: AppColors.borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: defaultRadius,
            borderSide: BorderSide(
              color: AppColors.borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: defaultRadius,
            borderSide: BorderSide(color: AppColors.borderColor, width: 0.5),
          ),
        ),
      ),
    );
  }
}

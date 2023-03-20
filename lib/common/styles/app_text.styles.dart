import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mica/common/styles/app_color.styles.dart';

class AppTextStyle {
  const AppTextStyle._();

  static TextStyle f12W400Black = TextStyle(
    fontSize: 12,
    color: AppColors.borderColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle f12W400BlackText = TextStyle(
    fontSize: 12,
    color: AppColors.textColorBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle f13W400Black = TextStyle(
    fontSize: 13,
    color: AppColors.borderColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle f14W400Black = TextStyle(
    fontSize: 14,
    color: AppColors.borderColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle f14W400White = TextStyle(
    fontSize: 14,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle f14W600White = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle f14W600BlackBold = TextStyle(
    fontSize: 14,
    color: AppColors.textColorBlack,
    fontWeight: FontWeight.w600,
  );
  static TextStyle f14W700BlackBold = TextStyle(
    fontSize: 14,
    color: AppColors.textColorBlack,
    fontWeight: FontWeight.w700,
  );

  static TextStyle f14W700Purple = TextStyle(
    fontSize: 14,
    color: AppColors.purple,
    fontWeight: FontWeight.w700,
  );
  static TextStyle f14W400BlackText = TextStyle(
    fontSize: 14,
    color: AppColors.textColorBlack,
    fontWeight: FontWeight.w400,
  );
  static TextStyle f30W500WhiteText = GoogleFonts.roboto(
    fontSize: 30,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle f16W500SecondariText = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle f14W600RobotoBlackBoldText = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.textColorBlack,
    fontWeight: FontWeight.w600,
  );
}

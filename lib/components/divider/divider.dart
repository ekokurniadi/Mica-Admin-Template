import 'package:flutter/material.dart';
import 'package:mica/common/styles/app_color.styles.dart';

class DividerSeparator extends StatelessWidget {
  const DividerSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.dividerColor,
    );
  }
}

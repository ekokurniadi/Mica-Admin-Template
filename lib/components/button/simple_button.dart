import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mica/common/constants/constant.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.backgroundColor,
    this.svgIcon,
    required this.iconColor,
    required this.onPress,
    this.icon,
  });

  final Color backgroundColor;
  final Color iconColor;

  final VoidCallback onPress;
  final String? svgIcon;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: defaultRadius,
        ),
        padding: const EdgeInsets.all(14),
        child: svgIcon != null
            ? SvgPicture.asset(
                svgIcon!,
                fit: BoxFit.cover,
                width: 20,
                color: iconColor,
                placeholderBuilder: (context) {
                  return SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: iconColor,
                    ),
                  );
                },
              )
            : Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallSimpleButton extends StatelessWidget {
  const SmallSimpleButton({
    super.key,
    this.svgIcon,
    required this.iconColor,
    required this.onPress,
    this.icon,
  });

  final Color iconColor;
  final VoidCallback onPress;
  final String? svgIcon;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashRadius: 1,
      onPressed: onPress,
      icon: svgIcon != null
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
    );
  }
}

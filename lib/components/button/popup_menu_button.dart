import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';

class SimplePopUpMenuButton<T> extends StatelessWidget {
  const SimplePopUpMenuButton(
      {super.key,
      required this.backgroundColor,
      this.svgIcon,
      required this.iconColor,
      required this.onSelected,
      this.icon,
      required this.children,
      this.toolTip,
      this.offset});

  final Color backgroundColor;
  final Color iconColor;
  final Function(T) onSelected;
  final String? svgIcon;
  final IconData? icon;
  final List<PopupMenuEntry<T>> children;
  final String? toolTip;
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: defaultRadius,
      ),
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        tooltip: toolTip,
        onSelected: onSelected,
        shape: RoundedRectangleBorder(
          borderRadius: defaultRadius,
        ),
        offset: offset == null ? const Offset(-80, 10) : offset!,
        color: AppColors.purple100,
        icon: svgIcon != null
            ? SvgPicture.asset(
                svgIcon!,
                fit: BoxFit.cover,
                width: 20,
                color: iconColor,
                clipBehavior: Clip.antiAlias,
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
        position: PopupMenuPosition.under,
        itemBuilder: (context) {
          return children;
        },
      ),
    );
  }
}

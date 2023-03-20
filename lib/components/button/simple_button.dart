import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/responsive/responsive.dart';

class SimpleButton extends StatefulWidget {
  const SimpleButton({
    super.key,
    required this.backgroundColor,
    this.svgIcon,
    required this.iconColor,
    required this.onPress,
    this.icon,
    required this.backgroundColorHover,
    required this.iconColorHover,
  });

  final Color backgroundColor;
  final Color iconColor;
  final Color backgroundColorHover;
  final Color iconColorHover;
  final VoidCallback onPress;
  final String? svgIcon;
  final IconData? icon;

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isHover,
        builder: (context, isHovered, childWidget) {
          return InkWell(
            onTap: widget.onPress,
            onHover: (val) {
              _isHover.value = val;
            },
            child: Container(
              decoration: BoxDecoration(
                color: _isHover.value
                    ? widget.backgroundColorHover
                    : widget.backgroundColor,
                borderRadius: defaultRadius,
              ),
              padding: EdgeInsets.all(
                Responsive.isDesktop(context) ? 10 : 14,
              ),
              child: widget.svgIcon != null
                  ? SvgPicture.asset(
                      widget.svgIcon!,
                      fit: BoxFit.cover,
                      width: 20,
                      color: _isHover.value
                          ? widget.iconColorHover
                          : widget.iconColor,
                      placeholderBuilder: (context) {
                        return SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: widget.iconColor,
                          ),
                        );
                      },
                    )
                  : Icon(
                      widget.icon,
                      size: 20,
                      color: _isHover.value
                          ? widget.iconColorHover
                          : widget.iconColor,
                    ),
            ),
          );
        });
  }
}

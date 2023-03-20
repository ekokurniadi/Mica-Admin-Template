import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';

class SimplePopUpMenuButton<T> extends StatefulWidget {
  const SimplePopUpMenuButton({
    super.key,
    required this.backgroundColor,
    this.svgIcon,
    required this.iconColor,
    required this.onSelected,
    this.icon,
    required this.children,
    this.toolTip,
    this.offset,
    required this.backgroundColorHover,
    required this.iconColorHover,
    this.isHaveDot = false,
  });

  final Color backgroundColor;
  final Color iconColor;
  final Color backgroundColorHover;
  final Color iconColorHover;
  final Function(T) onSelected;
  final String? svgIcon;
  final IconData? icon;
  final List<PopupMenuEntry<T>> children;
  final String? toolTip;
  final Offset? offset;
  final bool isHaveDot;

  @override
  State<SimplePopUpMenuButton<T>> createState() =>
      _SimplePopUpMenuButtonState<T>();
}

class _SimplePopUpMenuButtonState<T> extends State<SimplePopUpMenuButton<T>>
    with TickerProviderStateMixin {
  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
      
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      _controller,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isHover,
      builder: (context, hover, childWidget) {
        return InkWell(
          onHover: (isHovered) {
            _isHover.value = isHovered;
          },
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: _isHover.value
                  ? widget.backgroundColorHover
                  : widget.backgroundColor,
              borderRadius: defaultRadius,
            ),
            child: Stack(
              children: [
                PopupMenuButton(
                  splashRadius: 1,
                  padding: EdgeInsets.zero,
                  tooltip: widget.toolTip,
                  onSelected: widget.onSelected,
                  shape: RoundedRectangleBorder(
                    borderRadius: defaultRadius,
                  ),
                  offset: widget.offset == null
                      ? const Offset(-80, 10)
                      : widget.offset!,
                  color: AppColors.primaryColor,
                  icon: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: widget.svgIcon != null
                            ? SvgPicture.asset(
                                widget.svgIcon!,
                                fit: BoxFit.cover,
                                width: 20,
                                color: _isHover.value
                                    ? widget.iconColorHover
                                    : widget.iconColor,
                                clipBehavior: Clip.antiAlias,
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
                      widget.isHaveDot
                          ? Positioned(
                              bottom: 0,
                              top: -15,
                              right: 8,
                              child: FadeTransition(
                                opacity: _animation,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  position: PopupMenuPosition.under,
                  itemBuilder: (context) {
                    return widget.children;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mica/common/styles/app_color.styles.dart';

class RotateFloatingActionButton extends StatefulWidget {
  const RotateFloatingActionButton({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  State<RotateFloatingActionButton> createState() =>
      _RotateFloatingActionButtonState();
}

class _RotateFloatingActionButtonState extends State<RotateFloatingActionButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
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
    return FloatingActionButton(
      backgroundColor: AppColors.purple,
      mini: true,
      onPressed: () {},
      child: RotationTransition(
        turns: _animation,
        child: Icon(
          Icons.settings,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

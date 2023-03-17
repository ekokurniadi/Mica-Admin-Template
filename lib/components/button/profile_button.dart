import 'package:flutter/material.dart';
import 'package:mica/common/styles/app_color.styles.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: AppColors.blue25,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SizedBox(
              width: 32,
              height: 32,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/png/profile-picture.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: AppColors.blue,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';
import 'package:mica/components/divider/divider.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/png/profile-picture.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Jhon Doe',
                        style: AppTextStyle.f12W400BlackText,
                      ),
                    ),
                    Text(
                      '2 min ago',
                      style: AppTextStyle.f12W400Black,
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Text(
                  'It is a long established fact that a reader will be distracted',
                  style: AppTextStyle.f12W400BlackText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.orange100,
                        borderRadius: defaultRadius,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        'Unread',
                        style: AppTextStyle.f12W400BlackText.copyWith(
                          color: AppColors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.yellow50,
                        borderRadius: defaultRadius,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        'New',
                        style: AppTextStyle.f12W400BlackText.copyWith(
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const DividerSeparator(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';
import 'package:mica/components/divider/divider.dart';
import 'package:mica/components/notifications/notification_list_items.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 128,
          ),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'All Notification',
                        style: AppTextStyle.f12W400BlackText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Mark all as read',
                        style: AppTextStyle.f12W400Black.copyWith(
                          color: AppColors.blue100,
                          decorationStyle: TextDecorationStyle.dashed,
                          decorationColor: AppColors.blue100,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  color: AppColors.primaryColor,
                  child: DropdownButtonFormField(
                    value: 'all',
                    dropdownColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      focusColor: AppColors.primaryColor,
                      filled: true,
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: defaultRadius,
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: defaultRadius,
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: defaultRadius,
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'all',
                        child: Text(
                          'All Notification',
                          style: AppTextStyle.f12W400BlackText,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'new',
                        child: Text(
                          'New',
                          style: AppTextStyle.f12W400BlackText,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'unread',
                        child: Text(
                          'Unread',
                          style: AppTextStyle.f12W400BlackText,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'other',
                        child: Text(
                          'Other',
                          style: AppTextStyle.f12W400BlackText,
                        ),
                      ),
                    ],
                    onChanged: (selected) {},
                  ),
                ),
                const DividerSeparator(),
                const NotificationListItem(),
                const NotificationListItem(),
                const NotificationListItem(),
                const NotificationListItem(),
                const NotificationListItem(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -3,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: AppColors.dividerColor,
                ),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: AppTextStyle.f12W400Black.copyWith(
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

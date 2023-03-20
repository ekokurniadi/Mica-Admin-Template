import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';
import 'package:mica/components/divider/divider.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 261,
      child: Drawer(
        elevation: 0.1,
        backgroundColor: AppColors.primaryColor,
        child: ListView(
          padding: const EdgeInsets.all(defaultPadding),
          children: [
            ListTile(
              title: SvgPicture.asset(
                'assets/images/svg/ic_app.svg',
                width: 92,
                height: 32,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Dashboard',
              style: AppTextStyle.f14W700BlackBold,
            ),
            const SizedBox(
              height: 14,
            ),
            DrawerListItem(
              svgSrc: 'assets/images/svg/ic_sidebar_menu_default.svg',
              title: 'Default',
              press: () {},
              selected: true,
            ),
            const SizedBox(
              height: 12,
            ),
            DrawerListItem(
              svgSrc: 'assets/images/svg/ic_sidebar_menu_analytics.svg',
              title: 'Analytics',
              press: () {},
            ),
            const DividerSeparator(),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Widget',
              style: AppTextStyle.f14W700BlackBold,
            ),
            const SizedBox(
              height: 14,
            ),
            DrawerListItem(
              svgSrc: 'assets/images/svg/ic_sidebar_menu_statistic.svg',
              title: 'Statistics',
              press: () {},
            ),
            const SizedBox(
              height: 12,
            ),
            DrawerListItem(
              svgSrc: 'assets/images/svg/ic_sidebar_menu_data.svg',
              title: 'Data',
              press: () {},
            ),
            const SizedBox(
              height: 12,
            ),
            DrawerListItem(
              svgSrc: 'assets/images/svg/ic_sidebar_menu_chart.svg',
              title: 'Chart',
              press: () {},
            ),
            const DividerSeparator(),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Application',
              style: AppTextStyle.f14W700BlackBold,
            ),
            const SizedBox(
              height: 14,
            ),
            DrawerListItemExpandable(
              svgSrc: 'assets/images/svg/ic_sidebar_menu_user.svg',
              title: 'User',
              press: () {},
            ),
            const SizedBox(
              height: 12,
            ),
            DrawerListItemExpandable(
              svgSrc: 'assets/images/svg/ic_sidebar_menu_customer.svg',
              title: 'Customer',
              press: () {},
            ),
            const SizedBox(
              height: 12,
            ),
            DrawerListItem(
              svgSrc: 'assets/images/svg/ic_sidebar_menu_chat.svg',
              title: 'Chat',
              press: () {},
            ),
            const DividerSeparator()
          ],
        ),
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
    this.selected = false,
  });

  final String title;
  final String svgSrc;
  final VoidCallback press;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      selected: selected,
      selectedTileColor: AppColors.purple100,
      shape: RoundedRectangleBorder(borderRadius: defaultRadius),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgSrc,
              width: 20,
              color: selected ? AppColors.purple : AppColors.textColorBlack,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: selected
                  ? AppTextStyle.f14W700Purple
                  : AppTextStyle.f14W400BlackText,
            )
          ],
        ),
      ),
    );
  }
}

class DrawerListItemExpandable extends StatelessWidget {
  DrawerListItemExpandable({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title;
  final String svgSrc;
  final VoidCallback press;

  final ValueNotifier<bool> isExpand = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isExpand,
        builder: (context, val, widget) {
          return ExpansionTile(
            onExpansionChanged: (value) {
              isExpand.value = value;
            },
            collapsedIconColor: AppColors.borderColor,
            iconColor: AppColors.purple,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    svgSrc,
                    width: 20,
                    color: isExpand.value
                        ? AppColors.purple
                        : AppColors.textColorBlack,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: isExpand.value
                        ? AppTextStyle.f14W700Purple
                        : AppTextStyle.f14W400BlackText,
                  )
                ],
              ),
            ),
            children: [
              ExpansionTileItemChildren(
                title: 'Autocomplete',
                press: () {},
              ),
              ExpansionTileItemChildren(
                title: 'Button',
                press: () {},
              ),
            ],
          );
        });
  }
}

class ExpansionTileItemChildren extends StatelessWidget {
  const ExpansionTileItemChildren({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: AppColors.purple100,
      shape: RoundedRectangleBorder(
        borderRadius: defaultRadius,
      ),
      onTap: press,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: defaultPadding,
          ),
          Icon(
            Icons.circle,
            size: 5,
            color: AppColors.textColorBlack,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: AppTextStyle.f14W400BlackText,
          ),
        ],
      ),
    );
  }
}

class SideBarController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}

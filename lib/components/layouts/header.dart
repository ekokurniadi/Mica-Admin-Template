import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/responsive/responsive.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/components/button/popup_menu_button.dart';
import 'package:mica/components/button/profile_button.dart';
import 'package:mica/components/button/simple_button.dart';
import 'package:mica/components/layouts/sidebar.dart';
import 'package:mica/components/search/search_field.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isShowSearchField = false;

  void showSearchField() {
    setState(() {
      isShowSearchField = !isShowSearchField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isShowSearchField
          ? Container(
              color: AppColors.primaryColor,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const SearchField(),
                  IconButton(
                    onPressed: () {
                      showSearchField();
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.borderColor,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              color: AppColors.primaryColor,
              padding: EdgeInsets.only(
                top: defaultPadding,
                bottom: defaultPadding,
                right: !Responsive.isDesktop(context) ? 12 : defaultPadding,
                left: !Responsive.isDesktop(context) ? 6 : defaultPadding,
              ),
              child: Row(
                children: [
                  if (!Responsive.isDesktop(context))
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: SimpleButton(
                        backgroundColor: AppColors.purple100,
                        icon: Icons.menu,
                        iconColor: AppColors.purple,
                        onPress: () {
                          context.read<SideBarController>().controlMenu();
                        },
                      ),
                    ),
                  if (Responsive.isMobile(context)) const Spacer(),
                  if (Responsive.isMobile(context))
                    Padding(
                      padding: EdgeInsets.only(
                        right:
                            !Responsive.isDesktop(context) ? 8 : defaultPadding,
                      ),
                      child: SimpleButton(
                        backgroundColor: AppColors.purple100,
                        icon: Icons.search,
                        iconColor: AppColors.purple,
                        onPress: () {
                          showSearchField();
                        },
                      ),
                    ),
                  if (Responsive.isDesktop(context) ||
                      Responsive.isTablet(context))
                    const SearchField(),
                  if (!Responsive.isMobile(context)) const Spacer(flex: 1),
                  Padding(
                    padding: EdgeInsets.only(
                        right: !Responsive.isDesktop(context)
                            ? 8
                            : defaultPadding),
                    child: SimplePopUpMenuButton<int>(
                      offset: const Offset(0, 10),
                      svgIcon: 'assets/images/svg/ic_quick_action.svg',
                      toolTip: '',
                      backgroundColor: AppColors.purple100,
                      iconColor: AppColors.purple,
                      onSelected: (value) {},
                      children: const [
                        PopupMenuItem(
                          value: 0,
                          child: Text("Settings"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right:
                          !Responsive.isDesktop(context) ? 8 : defaultPadding,
                    ),
                    child: SimpleButton(
                      backgroundColor: AppColors.blue25,
                      svgIcon: 'assets/images/svg/ic_language.svg',
                      iconColor: AppColors.blue,
                      onPress: () {
                        context.read<SideBarController>().controlMenu();
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     right:
                  //         !Responsive.isDesktop(context) ? 8 : defaultPadding,
                  //   ),
                  //   child: SimplePopUpMenuButton<int>(
                  //     offset: const Offset(0, 10),
                  //     svgIcon: 'assets/images/svg/ic_language.svg',
                  //     toolTip: '',
                  //     backgroundColor: AppColors.blue25,
                  //     iconColor: AppColors.purple,
                  //     onSelected: (value) {},
                  //     children: const [
                  //       PopupMenuItem(
                  //         value: 0,
                  //         child: Text("Settings"),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                      right:
                          !Responsive.isDesktop(context) ? 8 : defaultPadding,
                    ),
                    child: SimplePopUpMenuButton<int>(
                      offset: const Offset(0, 10),
                      svgIcon: 'assets/images/svg/ic_notification.svg',
                      toolTip: '',
                      backgroundColor: AppColors.purple100,
                      iconColor: AppColors.purple,
                      onSelected: (value) {},
                      children: const [
                        PopupMenuItem(
                          value: 0,
                          child: Text("Settings"),
                        ),
                      ],
                    ),
                  ),
                  const ProfileButton(),
                ],
              ),
            ),
    );
  }
}

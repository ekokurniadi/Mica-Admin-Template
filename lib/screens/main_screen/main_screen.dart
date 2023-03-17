import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/responsive/responsive.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/components/button/floating_action_button.dart';
import 'package:mica/components/layouts/header.dart';
import 'package:mica/components/layouts/sidebar.dart';
import 'package:mica/screens/main_screen/content/dashboard.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayColor,
      key: context.read<SideBarController>().scaffoldKey,
      drawer: const SideBar(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) const SideBar(),
            Expanded(
              flex: 5,
              child: ListView(
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                children: const [
                  Header(),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: DashboardScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: RotateFloatingActionButton(onPress: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

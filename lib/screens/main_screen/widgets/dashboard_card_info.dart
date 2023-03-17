import 'package:flutter/material.dart';

import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/responsive/responsive.dart';
import 'package:mica/common/styles/app_color.styles.dart';
import 'package:mica/common/styles/app_text.styles.dart';
import 'package:mica/components/button/popup_menu_button.dart';
import 'package:mica/components/button/simple_button.dart';
import 'package:mica/components/chart/fl_chart/card_info_chart.dart';

class DashboardCardInfo extends StatefulWidget {
  const DashboardCardInfo({super.key});

  @override
  State<DashboardCardInfo> createState() => _DashboardCardInfoState();
}

class _DashboardCardInfoState extends State<DashboardCardInfo> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileCard(),
      desktop: DesktopCard(),
      tablet: DesktopCard(),
    );
  }
}

class MobileCard extends StatefulWidget {
  const MobileCard({super.key});

  @override
  State<MobileCard> createState() => _MobileCardState();
}

class _MobileCardState extends State<MobileCard> {
  bool chartMonthly = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* PURPLE CARD */
        ClipRRect(
          borderRadius: defaultRadius,
          child: Container(
            height: 196,
            decoration: BoxDecoration(
              borderRadius: defaultRadius,
              color: AppColors.purple,
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  top: -100,
                  right: 5,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.purple300,
                    ),
                  ),
                ),
                Positioned(
                  top: -60,
                  right: -80,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.purple400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: defaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SimpleButton(
                            backgroundColor: AppColors.purple400,
                            iconColor: AppColors.primaryColor,
                            onPress: () {},
                            svgIcon: 'assets/images/svg/ic_earning.svg',
                          ),
                          SimplePopUpMenuButton<int>(
                            icon: Icons.more_horiz,
                            toolTip: '',
                            backgroundColor: AppColors.purple300,
                            iconColor: AppColors.primaryColor,
                            onSelected: (value) {},
                            children: const [
                              PopupMenuItem(
                                value: 0,
                                child: Text("Settings"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$500.00',
                            style: AppTextStyle.f30W500WhiteText,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Transform.rotate(
                            alignment: AlignmentDirectional.topEnd,
                            angle: 120,
                            child: ClipOval(
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                color: AppColors.purple200,
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: AppColors.purple,
                                  textDirection: TextDirection.ltr,
                                  size: 17,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Total Earning',
                        style: AppTextStyle.f16W500SecondariText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        /* END OF PURPLE CARD */

        const SizedBox(
          height: defaultPadding,
        ),

        /* BLUE CARD */
        ClipRRect(
          borderRadius: defaultRadius,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: defaultRadius,
              color: AppColors.blue,
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  top: -100,
                  right: 5,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.blue100,
                    ),
                  ),
                ),
                Positioned(
                  top: -60,
                  right: -80,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.blue200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: defaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SimpleButton(
                            backgroundColor: AppColors.blue200,
                            iconColor: AppColors.primaryColor,
                            onPress: () {},
                            icon: Icons.shopping_bag_outlined,
                          ),
                          Row(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: chartMonthly
                                      ? AppColors.blue
                                      : Colors.transparent,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    chartMonthly = true;
                                  });
                                },
                                child: Text(
                                  'Month',
                                  style: AppTextStyle.f14W400White,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: !chartMonthly
                                      ? AppColors.blue
                                      : Colors.transparent,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    chartMonthly = false;
                                  });
                                },
                                child: Text(
                                  'Year',
                                  style: AppTextStyle.f14W400White,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '\$961.00',
                                    style: AppTextStyle.f30W500WhiteText,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Transform.rotate(
                                    alignment: AlignmentDirectional.topEnd,
                                    angle: 120,
                                    child: ClipOval(
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        color: AppColors.blue30,
                                        child: Icon(
                                          Icons.arrow_downward,
                                          color: AppColors.blue,
                                          textDirection: TextDirection.ltr,
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Total Order',
                                style: AppTextStyle.f16W500SecondariText,
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CardInfoChart(
                              isMonthly: chartMonthly,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        /* END OF BLUE CARD */

        const SizedBox(
          height: defaultPadding,
        ),

        /* DOUBLE CARD */
        Column(
          children: [
            ClipRRect(
              borderRadius: defaultRadius,
              child: Container(
                height: 90,
                color: AppColors.blue,
                child: Stack(
                  children: [
                    Positioned(
                      top: -135,
                      right: -50,
                      child: Container(
                        width: 150,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.blue50,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      right: -120,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.topStart,
                            end: Alignment.center,
                            colors: [
                              AppColors.blue25,
                              AppColors.blue30,
                              AppColors.blue50,
                              AppColors.blue100,
                              AppColors.blue200,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Row(
                        children: [
                          const SizedBox(width: defaultPadding),
                          SimpleButton(
                            backgroundColor: AppColors.blue200,
                            iconColor: AppColors.primaryColor,
                            onPress: () {},
                            icon: Icons.account_balance_wallet_outlined,
                          ),
                          const SizedBox(width: defaultPadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$203k',
                                style: AppTextStyle.f14W600White,
                              ),
                              Text(
                                'Total Income',
                                style: AppTextStyle.f14W400White
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            ClipRRect(
              borderRadius: defaultRadius,
              child: Container(
                height: 90,
                color: AppColors.primaryColor,
                child: Stack(
                  children: [
                    Positioned(
                      top: -135,
                      right: -50,
                      child: Container(
                        width: 150,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.yellow100,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      right: -120,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomCenter,
                            colors: [
                              AppColors.yellow50,
                              AppColors.yellow100,
                              AppColors.yellow200,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Row(
                        children: [
                          const SizedBox(width: defaultPadding),
                          SimpleButton(
                            backgroundColor: AppColors.yellow,
                            iconColor: AppColors.primaryColor,
                            onPress: () {},
                            icon: Icons.storefront,
                          ),
                          const SizedBox(width: defaultPadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$203k',
                                style: AppTextStyle.f14W600BlackBold,
                              ),
                              Text(
                                'Total Income',
                                style: AppTextStyle.f14W400BlackText
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DesktopCard extends StatefulWidget {
  const DesktopCard({super.key});

  @override
  State<DesktopCard> createState() => _DesktopCardState();
}

class _DesktopCardState extends State<DesktopCard> {
  bool chartMonthly = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* PURPLE CARD */
        Expanded(
          child: ClipRRect(
            borderRadius: defaultRadius,
            child: Container(
              height: 196,
              decoration: BoxDecoration(
                borderRadius: defaultRadius,
                color: AppColors.purple,
              ),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: -100,
                    right: 5,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.purple300,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -60,
                    right: -80,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.purple400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: defaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SimpleButton(
                              backgroundColor: AppColors.purple400,
                              iconColor: AppColors.primaryColor,
                              onPress: () {},
                              svgIcon: 'assets/images/svg/ic_earning.svg',
                            ),
                            SimplePopUpMenuButton<int>(
                              icon: Icons.more_horiz,
                              toolTip: '',
                              backgroundColor: AppColors.purple300,
                              iconColor: AppColors.primaryColor,
                              onSelected: (value) {},
                              children: const [
                                PopupMenuItem(
                                  value: 0,
                                  child: Text("Settings"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$500.00',
                              style: AppTextStyle.f30W500WhiteText,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Transform.rotate(
                              alignment: AlignmentDirectional.topEnd,
                              angle: 120,
                              child: ClipOval(
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  color: AppColors.purple200,
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: AppColors.purple,
                                    textDirection: TextDirection.ltr,
                                    size: 17,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Total Earning',
                          style: AppTextStyle.f16W500SecondariText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        /* END OF PURPLE CARD */

        const SizedBox(
          width: defaultPadding,
        ),

        /* BLUE CARD */
        Expanded(
          child: ClipRRect(
            borderRadius: defaultRadius,
            child: Container(
              height: 196,
              decoration: BoxDecoration(
                borderRadius: defaultRadius,
                color: AppColors.blue,
              ),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: -100,
                    right: 5,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.blue100,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -60,
                    right: -80,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.blue200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: defaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SimpleButton(
                              backgroundColor: AppColors.blue200,
                              iconColor: AppColors.primaryColor,
                              onPress: () {},
                              icon: Icons.shopping_bag_outlined,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: chartMonthly
                                        ? AppColors.blue
                                        : Colors.transparent,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      chartMonthly = true;
                                    });
                                  },
                                  child: Text(
                                    'Month',
                                    style: AppTextStyle.f14W400White,
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: !chartMonthly
                                        ? AppColors.blue
                                        : Colors.transparent,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      chartMonthly = false;
                                    });
                                  },
                                  child: Text(
                                    'Year',
                                    style: AppTextStyle.f14W400White,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$961.00',
                                      style: AppTextStyle.f30W500WhiteText,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Transform.rotate(
                                      alignment: AlignmentDirectional.topEnd,
                                      angle: 120,
                                      child: ClipOval(
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          color: AppColors.blue30,
                                          child: Icon(
                                            Icons.arrow_downward,
                                            color: AppColors.blue,
                                            textDirection: TextDirection.ltr,
                                            size: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Total Order',
                                  style: AppTextStyle.f16W500SecondariText,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CardInfoChart(
                                isMonthly: chartMonthly,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        /* END OF BLUE CARD */

        const SizedBox(
          width: defaultPadding,
        ),

        /* DOUBLE CARD */
        Expanded(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: defaultRadius,
                child: Container(
                  height: 90,
                  color: AppColors.blue,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -135,
                        right: -50,
                        child: Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.blue50,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -40,
                        right: -120,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: Alignment.center,
                              colors: [
                                AppColors.blue25,
                                AppColors.blue30,
                                AppColors.blue50,
                                AppColors.blue100,
                                AppColors.blue200,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          children: [
                            const SizedBox(width: defaultPadding),
                            SimpleButton(
                              backgroundColor: AppColors.blue200,
                              iconColor: AppColors.primaryColor,
                              onPress: () {},
                              icon: Icons.account_balance_wallet_outlined,
                            ),
                            const SizedBox(width: defaultPadding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '\$203k',
                                  style: AppTextStyle.f14W600White,
                                ),
                                Text(
                                  'Total Income',
                                  style: AppTextStyle.f14W400White
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              ClipRRect(
                borderRadius: defaultRadius,
                child: Container(
                  height: 90,
                  color: AppColors.primaryColor,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -135,
                        right: -50,
                        child: Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.yellow100,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -40,
                        right: -120,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomCenter,
                              colors: [
                                AppColors.yellow50,
                                AppColors.yellow100,
                                AppColors.yellow200,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          children: [
                            const SizedBox(width: defaultPadding),
                            SimpleButton(
                              backgroundColor: AppColors.yellow,
                              iconColor: AppColors.primaryColor,
                              onPress: () {},
                              icon: Icons.storefront,
                            ),
                            const SizedBox(width: defaultPadding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '\$203k',
                                  style: AppTextStyle.f14W600BlackBold,
                                ),
                                Text(
                                  'Total Income',
                                  style: AppTextStyle.f14W400BlackText
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

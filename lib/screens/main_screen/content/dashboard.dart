import 'package:flutter/material.dart';
import 'package:mica/common/constants/constant.dart';
import 'package:mica/common/responsive/responsive.dart';
import 'package:mica/components/datatables/datatables_product.dart';
import 'package:mica/screens/main_screen/widgets/dashboard_bar_chart.dart';
import 'package:mica/screens/main_screen/widgets/dashboard_card_info.dart';
import 'package:mica/screens/main_screen/widgets/popular_stock.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardCardInfo(),
        const SizedBox(height: defaultPadding),
        !Responsive.isMobile(context)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    flex: 2,
                    child: DashboardBarChart(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: PopularStock(),
                  )
                ],
              )
            : Column(
                children: const [
                  DashboardBarChart(),
                  SizedBox(height: defaultPadding),
                  PopularStock(),
                ],
              ),
        const SizedBox(height: defaultPadding),
        const TableProduct(),
      ],
    );
  }
}

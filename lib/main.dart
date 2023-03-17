import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mica/components/layouts/sidebar.dart';
import 'package:mica/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SideBarController(),
      child: MaterialApp(
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            child,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            ],
            background: Container(
              color: Colors.transparent,
            ),
          );
        },
        debugShowCheckedModeBanner: true,
        title: 'Mica Template',
        theme: ThemeData.light(
          useMaterial3: false,
        ).copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ).copyWith(),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.black,
          ),
        ),
        home: const MainScreen(),
      ),
    );
  }
}

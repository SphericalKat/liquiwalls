import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liqui_walls/router/router.gr.dart';
import 'package:liqui_walls/themes/theme.dart';

void main() async {
  runApp(WallsApp());
}

class WallsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LiquiWalls',
      builder: ExtendedNavigator.builder<CustomRouter>(
        router: CustomRouter(),
        builder: (context, extendedNav) => Theme(
          data: lightTheme,
          child: extendedNav,
        ),
      ),
    );
  }
}

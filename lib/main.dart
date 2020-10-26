import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
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
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}

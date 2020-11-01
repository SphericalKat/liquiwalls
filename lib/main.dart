import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:liqui_walls/controllers/bindings.dart';
import 'package:liqui_walls/router/router.gr.dart';
import 'package:liqui_walls/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox("favorites");
  if (box.get('favorites') == null) {
    box.put('theme', 'dark');
  }
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
            InitBindings().dependencies();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'LiquiWalls',
              builder: ExtendedNavigator.builder<CustomRouter>(
                router: CustomRouter(),
                builder: (context, extendedNav) => ValueListenableBuilder(
                  valueListenable: Hive.box("favorites").listenable(keys: ['theme']),
                  builder: (context, box, widget) => Theme(
                    data: box.get('theme') == 'light' ? lightTheme : darkTheme,
                    child: extendedNav,
                  ),
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

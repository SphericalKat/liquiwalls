// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/apply_page.dart';
import '../pages/home_page.dart';

class Routes {
  static const String homePage = '/';
  static const String applyPage = '/apply';
  static const all = <String>{
    homePage,
    applyPage,
  };
}

class CustomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.applyPage, page: ApplyPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    ApplyPage: (data) {
      final args = data.getArgs<ApplyPageArguments>(
        orElse: () => ApplyPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ApplyPage(
          key: args.key,
          url: args.url,
          id: args.id,
          category: args.category,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ApplyPage arguments holder class
class ApplyPageArguments {
  final Key key;
  final String url;
  final String id;
  final String category;
  ApplyPageArguments({this.key, this.url, this.id, this.category});
}

import 'package:auto_route/auto_route_annotations.dart';
import 'package:liqui_walls/pages/apply_page.dart';
import 'package:liqui_walls/pages/home_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomePage, initial: true),
  MaterialRoute(page: ApplyPage, path: '/apply'),
])
class $CustomRouter {}

import 'package:auto_route/auto_route_annotations.dart';
import 'package:liqui_walls/pages/homepage.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomePage, initial: true)
])
class $CustomRouter {}
import 'package:get/get.dart';
import 'package:liqui_walls/controllers/walls.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<WallsController>(WallsController(), permanent: true);
  }
}
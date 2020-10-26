import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WallsController extends GetxController {
  static WallsController get to => Get.find();
  var walls = Rx<QuerySnapshot>();
  var categories = Rx<QuerySnapshot>();

  @override
  void onInit() {
    super.onInit();
    walls
        .bindStream(FirebaseFirestore.instance.collection("walls").snapshots());
    categories.bindStream(
        FirebaseFirestore.instance.collection("categories").snapshots());
  }
}

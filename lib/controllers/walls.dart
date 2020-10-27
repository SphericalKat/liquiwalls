import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class WallsController extends GetxController {
  static WallsController get to => Get.find();
  var walls = Rx<QuerySnapshot>();
  var categories = Rx<QuerySnapshot>();
  var wallsBox = Hive.box("favorites");

  @override
  void onInit() {
    super.onInit();
    walls
        .bindStream(FirebaseFirestore.instance.collection("walls").snapshots());
    categories.bindStream(
        FirebaseFirestore.instance.collection("categories").snapshots());
  }

  Future<bool> toggleFavorite(String id, url) async {
    var docRef = FirebaseFirestore.instance.collection("walls").doc(id);

    // if already favorited by this user
    if (wallsBox.get(id) != null) {
      try {
        // delete it from local storate
        await wallsBox.delete(id);

        // decrement favorite count for this wallpaper
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          var snapshot = await transaction.get(docRef);
          int currentCount = snapshot.data()['favorites'] ?? 1;
          transaction.update(docRef, {'favorites': currentCount - 1});
        });
        return false;
      } catch (e) {
        print(e.toString());
        return true;
      }
    }

    // not favorited by user at this time
    try {
      // save to local storage
      await wallsBox.put(id, url);

      // increment favorite count for this wall
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        var snapshot = await transaction.get(docRef);
        int newCount = (snapshot.data()['favorites'] ?? 0) + 1;
        transaction.update(docRef, {'favorites': newCount});
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}

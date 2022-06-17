import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Totalcomplaintcontroller extends GetxController {
  var ids;
  var status;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateStatus();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    updateStatus();
  }

  updateStatus() {
    FirebaseFirestore.instance
        .collection('complaint')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        print(doc.id);
        ids = doc.id.toString();
        print("Data is ................................" + ids.toString());
        update();
      }
      update();
    });
  }

  // update user status
  CollectionReference users =
      FirebaseFirestore.instance.collection('complaint');

  Future<void> updateUser(currentIndex) {
    return users
        .doc(ids)
        .collection("complaint")
        .doc(currentIndex)
        .update({'status': 'Completed'})
        .then((value) => print("User Updated"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to update user: $error"));
  }

  // Delete user //
  CollectionReference users1 =
      FirebaseFirestore.instance.collection('complaint');

  Future<void> deleteUser(currentIndexs) {
    return users1
        .doc(ids)
        .collection("complaint")
        .doc(currentIndexs)
        .delete()
        .then((value) {
      print("User Deleted");
      update();
    }).catchError((error) => print("Failed to delete user: $error"));
    update();
  }
}

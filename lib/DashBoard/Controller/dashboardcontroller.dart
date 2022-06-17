import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Dashboardcontroller extends GetxController {
  var compalaintids;
  var userIds;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getUsersIDs();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getComplaintIDs();
    getUsersIDs();
  }

  /// get ids/////////////
  getComplaintIDs() {
    FirebaseFirestore.instance
        .collection('complaint')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        print(doc.id);
        compalaintids = doc.id.toString();
        print("complaint ids is ................................" +
            compalaintids.toString());
        update();
      }
      update();
    });
    update();
  }

  getUsersIDs() {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        update();
        print(doc.id);
        update();
        userIds = doc.id.toString();
        print("Users ids is ................................" +
            userIds.toString());
        update();
      }
      update();
    });
    update();
  }
}

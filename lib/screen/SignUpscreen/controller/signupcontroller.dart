import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solidwasteadmin/DashBoard/view/dashboard.dart';

class SignUpController extends GetxController {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  var metaData;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User> handleSignUp() async {
    print("${emailcontroller.text}");
    print("${passcontroller.text}");
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: emailcontroller.text, password: passcontroller.text);
    final User user = result.user!;
    metaData = user.metadata.toString();
    print("Metadata" + user.metadata.toString());
    print(result.user!.toString());
    addToFireStore();
    return user;
  }

  addToFireStore() {
    CollectionReference users = FirebaseFirestore.instance.collection('admin');
    return users.doc(emailcontroller.text).collection("admin").add({
      'firstName': namecontroller.text,
      'lastName': "user",
      "email": emailcontroller.text,
      "password": passcontroller.text,
      "type": "admin",
      "date": DateTime.now(),
      "Metadata": metaData,
    }).then((value) {
      print(value.toString());
      Get.to(() => Dashboard());
    });
  }
}

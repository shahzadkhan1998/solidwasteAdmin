import 'package:custom_clippers/Clippers/ticket_pass_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solidwasteadmin/screen/SignUpscreen/controller/signupcontroller.dart';

class SignupScreen extends GetResponsiveView {
  SignupScreen({Key? key})
      : super(
          key: key,
          settings: const ResponsiveScreenSettings(
              desktopChangePoint: 800,
              tabletChangePoint: 700,
              watchChangePoint: 600),
        );

  final signupcontroller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ClipPath(
                clipper: TicketPassClipper(position: 100, holeRadius: 40),
                child: Container(
                  height: Get.height * 0.40,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.montserrat(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: signupcontroller.namecontroller,
                decoration: InputDecoration(
                  hintText: "Enter name",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: signupcontroller.emailcontroller,
                decoration: InputDecoration(
                  hintText: "Enter email",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: signupcontroller.passcontroller,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.08,
            ),
            ElevatedButton(
              onPressed: () {
                // Get.toNamed("/");
                signupcontroller.handleSignUp();
                // signupcontroller.addToFireStore();
              },
              child: const Text("Sign Up"),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Wrap(
              children: [
                Text(
                  "have account ?",
                  style: GoogleFonts.montserrat(color: Colors.black),
                ),
                Text(
                  "Login",
                  style: GoogleFonts.montserrat(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

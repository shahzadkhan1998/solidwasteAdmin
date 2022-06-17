import 'package:custom_clippers/Clippers/ticket_pass_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solidwasteadmin/screen/SignUpscreen/view/signupscreen.dart';

import 'controller/logincontroller.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Login",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: TicketPassClipper(position: 100, holeRadius: 40),
                child: Container(
                  height: Get.height * 0.40,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.montserrat(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _loginController.email,
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
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _loginController.password,
                decoration: InputDecoration(
                  hintText: "Enter password",
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
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _loginController.callLogin();
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.montserrat(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Text("Have Not Account ?", style: GoogleFonts.montserrat()),
                  InkWell(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.montserrat(color: Colors.green),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

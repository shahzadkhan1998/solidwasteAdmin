import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solidwasteadmin/component/drawer.dart';

import '../../screen/TotalComplaint/view/totalcomplaint.dart';
import '../../screen/TotalUsers/view/totalusers.dart';
import '../Controller/dashboardcontroller.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Dashboardcontroller _dashboardcontroller = Get.put(Dashboardcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Dashboard",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            decoration:
                const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "sample Name",
                style: GoogleFonts.montserrat(color: Colors.black),
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Admin Dashboard",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("complaint")
                          .doc(_dashboardcontroller.compalaintids)
                          .collection("complaint")
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            Get.to(() => TotalComplaint());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 300,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: GridTile(
                                footer: Center(
                                  child: Container(
                                    height: 30,
                                    width: Get.width,
                                    color: Colors.grey,
                                    child: Center(
                                      child: Text(
                                        "More info =>",
                                        style: GoogleFonts.montserrat(),
                                      ),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    snapshot.data!.docs.length < 1
                                        ? Text(
                                            "Total Complaints",
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 30),
                                          )
                                        : Text(
                                            "",
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(_dashboardcontroller.userIds)
                          .collection("users")
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => const TotalUser());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 300,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20)),
                              child: GridTile(
                                footer: Center(
                                  child: Container(
                                    height: 30,
                                    width: Get.width,
                                    color: Colors.grey,
                                    child: Center(
                                      child: Text(
                                        "More info =>",
                                        style: GoogleFonts.montserrat(),
                                      ),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total Users",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        "",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: GridTile(
                        footer: Center(
                          child: Container(
                            height: 30,
                            width: Get.width,
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                "More info =>",
                                style: GoogleFonts.montserrat(),
                              ),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Complaint Solved",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 30),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "",
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Text(
          "all right reserved",
          style: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

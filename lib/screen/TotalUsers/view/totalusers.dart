import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalUser extends StatelessWidget {
  const TotalUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Total Users"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Table(
              defaultColumnWidth: const FixedColumnWidth(80.0),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 1),
              children: [
                TableRow(children: [
                  Column(children: [
                    Text('Serial No:',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('First-Name',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Last-Name',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Email',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Password',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('type',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Date',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                ]),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No Data"),
                    );
                  }
                  if (snapshot.hasError) {
                    Fluttertoast.showToast(msg: "Error ${snapshot.hasError}");
                  }
                  if (snapshot.data!.docs.length < 1) {
                    return const Center(
                      child: Text("No Data"),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var ids = snapshot.data!.docs[index].id.toString().trim();
                      print("The Ids is :${ids.toString()}");
                      return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(ids)
                            .collection("users")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot<dynamic>> snapshot1) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator.adaptive();
                          }
                          if (!snapshot1.hasData) {
                            return const Center(
                              child: Text("No Data"),
                            );
                          }
                          if (snapshot1.hasError) {
                            Fluttertoast.showToast(
                                msg: "Error ${snapshot1.hasError}");
                          }
                          if (snapshot1.data!.docs.length < 1) {
                            return const Center(
                              child: Text("No Data"),
                            );
                          }

                          return ListView.builder(
                            itemCount: snapshot1.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int i) {
                              var allData = snapshot1.data!.docs[i].data();
                              print("The All data : $allData");
                              DateTime fetchedDate = allData["date"]?.toDate();
                              print("The date is : $fetchedDate");
                              return Container(
                                width: double.infinity,
                                child: Table(
                                  defaultColumnWidth:
                                      const FixedColumnWidth(80.0),
                                  border: TableBorder.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                  ),
                                  children: [
                                    TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Text('$index',
                                                style: GoogleFonts.actor(
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('${allData["firstName"]}',
                                                style: GoogleFonts.actor(
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('${allData["lastName"]}',
                                                style: GoogleFonts.actor(
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('${allData["email"]}',
                                                style: GoogleFonts.actor(
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('${allData["password"]}',
                                                style: GoogleFonts.actor(
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('${allData["type"]}',
                                                style: GoogleFonts.actor(
                                                    fontSize: 15))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('$fetchedDate',
                                                style: GoogleFonts.actor(
                                                    fontSize: 15))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

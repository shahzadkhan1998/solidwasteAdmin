import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/totalcomplaintcontroller.dart';

class TotalComplaint extends StatelessWidget {
  TotalComplaint({Key? key}) : super(key: key);
  var list = [
    {"Name": "Apple", "price": "50", "kg": "1"},
  ];
  Totalcomplaintcontroller _totalcomplaintcontroller =
      Get.put(Totalcomplaintcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Total Complaint",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                    Text('Name',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Email',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('phone',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Title',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Description',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Time',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Date',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Geolocation',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Location',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Lat',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Long',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('type',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('image',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('status',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                  Column(children: [
                    Text('Button',
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ]),
                ]),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("complaint")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (snapshot.hasError) {
                  Fluttertoast.showToast(msg: "Error....${snapshot.hasError}");
                }
                if (snapshot.data!.docs.length < 1) {
                  return const Center(
                    child: Text("No data found"),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data!.docs[index].id.toString();
                    print("Data is : $data");

                    return FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection("complaint")
                          .doc(data)
                          .collection("complaint")
                          .get(),
                      builder: (BuildContext context, AsyncSnapshot snapshot1) {
                        if (snapshot1.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        if (snapshot.hasError) {
                          Fluttertoast.showToast(
                              msg: "Error....${snapshot.hasError}");
                        }
                        if (snapshot1.data!.docs.length < 1) {
                          return const Center(
                            child: Text("No data found"),
                          );
                        }
                        if (!snapshot1.hasData) {
                          return const Center(
                            child: Text("No data found"),
                          );
                        }
                        print("$snapshot1");

                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                            itemCount: snapshot1.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int i) {
                              var allData = snapshot1.data!.docs[i].data();
                              var image = snapshot1.data!.docs[i]
                                  .data()["image"]
                                  .toString();
                              var date =
                                  (allData['date'] as Timestamp).toDate();
                              var time =
                                  (allData['time'] as Timestamp).toDate();
                              print("Image is ...... : $image");
                              var id = snapshot1.data!.docs[i].id.toString();
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
                                    TableRow(children: [
                                      Column(children: [
                                        Text('$i',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 15))
                                      ]),
                                      Column(children: [
                                        Text('${allData["name"]}',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('${allData["email"]}',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('${allData["phone"]}',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('${allData["title"]}',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('${allData["description"]}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('$time',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('$date',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text(' ${allData["goolelocation"]} ',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('${allData["location"]} ',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('${allData["lat"]} ',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('${allData["long"]} ',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Text('${allData["type"]} ',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: CachedNetworkImage(
                                            imageUrl: image.toString(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Colors.red,
                                                            BlendMode
                                                                .colorBurn)),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ]),
                                      Column(children: [
                                        Text('${allData["status"]} ',
                                            style: GoogleFonts.montserrat())
                                      ]),
                                      Column(children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            Center(
                                                child: TextButton(
                                              onPressed: () {
                                                print("clicked");
                                                _totalcomplaintcontroller
                                                    .updateUser(id);
                                              },
                                              child: Text(
                                                "Approve",
                                                style: GoogleFonts.montserrat(),
                                              ),
                                            )),
                                            const Divider(),
                                            Center(
                                                child: TextButton(
                                              onPressed: () {
                                                print("clicked");
                                                _totalcomplaintcontroller
                                                    .deleteUser(id);
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: GoogleFonts.montserrat(),
                                              ),
                                            )),
                                          ],
                                        )
                                      ]),
                                    ]),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

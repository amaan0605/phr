import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../services/firebase_firestore_docs.dart';
import 'book_appointnment.dart';

class Appointnment extends StatefulWidget {
  const Appointnment({Key? key}) : super(key: key);

  @override
  State<Appointnment> createState() => _AppointnmentState();
}

// In this class we show all the appointment that are booked and we can also book the appointment by clicking book appointment
//In this class there are text and button and stream builder.
//when we click on the button we go to the bookappointnment  page you can see the page in the same directory
//stream builder is used to get all appointment from firebase using class FirebaseFirestoreDocs(which can be found in services folder)
//and then making EachAppointment widget(which is a class in the same file below) for every widget and then making list view .

class _AppointnmentState extends State<Appointnment> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        margin: const EdgeInsets.only(bottom: 30),
        // height: _height,

        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 0.05 * height, bottom: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      iconSize: 30,
                    )),
                Container(
                  margin:
                      EdgeInsets.only(left: 30, top: 0.05 * height, bottom: 10),
                  child: Text(
                    "Book Appointments",
                    style: TextStyle(
                        color: const Color(0xff112C41),
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.03),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.75,
              child: SingleChildScrollView(
                child: StreamBuilder<QuerySnapshot>(
                  // FirebaseFirestoreDocs abc=new FirebaseFirestoreDocs();
                  stream: FirebaseFirestoreDocs.getAppointment(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/ApointPagePhoto.png"),
                                    fit: BoxFit.contain)),
                          )
                        : SizedBox(
                            height: height * 0.75,
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                print('inside');
                                print('inside');
                                print('inside');
                                print('inside');
                                print('inside');
                                print('inside');
                                print('inside');

                                DocumentSnapshot appointment =
                                    snapshot.data!.docs[index];
                                // print(document.data());

                                return Container(
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  child: EachAppointment(
                                    date: appointment["Date"],
                                    status: appointment["status"],
                                    width: width * 0.9,
                                    type: appointment['AppointmentType'],
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              height: 0.07 * height,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookAppointnment()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff5669FF),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xff5669FF),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Book Appointment',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 0.025 * height,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//This is a widget used to show   a single appointment .This widget is used in the above class where all appointment are shown.
//It take  input that are date,type,status,width to show all information of that particular appointment
//This class consist of some container and text for printing the appointment data.
class EachAppointment extends StatefulWidget {
  final String date;
  final String type;
  final String status;
  final double width;

  const EachAppointment({
    Key? key,
    required this.date,
    required this.type,
    required this.status,
    required this.width,
  }) : super(key: key);

  @override
  State<EachAppointment> createState() => _EachAppointmentState();
}

class _EachAppointmentState extends State<EachAppointment> {
  @override
  Widget build(BuildContext context) {
    // var padding = MediaQuery.of(context).padding;
    // double height = (MediaQuery.of(context).size.height) - padding.top;
    List<String> substrings = widget.date.split(" ");
    List<String> getsdate = substrings[1].split(",");
    // print(substrings);
    // print(getsdate[1]);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
          padding: const EdgeInsets.only(left: 25, top: 14),
          height: 110,
          width: widget.width, //?? MediaQuery.of(context).size.width,
          // margin: EdgeInsets.only( right: 10, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Upcomming",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Card(
                    // margin: EdgeInsets.all(10),
                    elevation: 3,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          decoration: const BoxDecoration(
                              color: Color(0xff42C834),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15))),
                          child: Center(
                              child: Text(
                            substrings[0],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            getsdate[0],
                            style: const TextStyle(
                                color: Color(0xff5A5858),
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                        Text(
                          substrings[2],
                          style: const TextStyle(
                              color: Color(0xff8D8D8E),
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Appointment with FitAahar',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff3D3D3D)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Type : ${widget.type}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffAAACAE)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Status : ${widget.status}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffAAACAE)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}

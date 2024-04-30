import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/services/firebase_firestore_docs.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

//In this class all document are shown  that are uploaded.
// This class is not in use.
class _TimelinePageState extends State<TimelinePage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: Column(children: [
        SizedBox(
          height: height * 0.05,
        ),
        Container(
          height: 0.067 * height,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              suffixIcon: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.keyboard_voice_outlined),
              ),
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffE4DFDF),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffE4DFDF),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              hintText: 'Search',
            ),
          ),
        ),
        SizedBox(
          height: height * 0.018,
        ),
        SizedBox(
          height: height * 0.75,
          child: SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
              // FirebaseFirestoreDocs abc=new FirebaseFirestoreDocs();
              stream: FirebaseFirestoreDocs.getDocuments(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? const Text('No Docunments')
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
                            DocumentSnapshot? previousdocument;
                            if (index > 0) {
                              previousdocument = snapshot.data!.docs[index - 1];
                            }
                            DocumentSnapshot document =
                                snapshot.data!.docs[index];
                            // print(document.data());
                            String datemonth = document['date'];
                            // String formattedDate = DateFormat('yyyy-MM-dd').format(datemonth);

                            print(datemonth);
                            // print(previousdocument!['date']);
                            if (index == 0 ||
                                (document['date'] !=
                                    previousdocument!['date'])) {
                              return Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 135,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        datemonth,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        child: EachDocument(
                                          hospitalName: document["Doctorname"],
                                          docunmentName: document["reportType"],
                                          width: width * 0.9,
                                          url: document['firebaseStorageUri'],
                                        ),
                                      )
                                    ]),
                              );
                            }

                            return Container(
                              height: 105,
                              margin: const EdgeInsets.only(left: 20),
                              child: EachDocument(
                                hospitalName: document["Doctorname"],
                                docunmentName: document["reportType"],
                                width: width * 0.9,
                                url: document['firebaseStorageUri'],
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ),
        ),
      ]),
    );
  }
}

class EachDocument extends StatefulWidget {
  final String hospitalName;
  final String docunmentName;
  final String url;
  final double? width;
  const EachDocument(
      {Key? key,
      required this.hospitalName,
      required this.docunmentName,
      required this.url,
      this.width})
      : super(key: key);

  @override
  State<EachDocument> createState() => _EachDocumentState();
}

class _EachDocumentState extends State<EachDocument> {
  @override
  Widget build(BuildContext context) {
    // var padding = MediaQuery.of(context).padding;
    // double height = (MediaQuery.of(context).size.height) - padding.top;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 100,
        width: widget.width ?? MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only( right: 10, bottom: 15),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 0.25, color: Colors.black54),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.url,
                    ),
                  )),
            ),

            // Expanded(
            //   child: Container(
            //
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      widget.hospitalName,
                      style: const TextStyle(
                          color: Color(0xff323232),
                          fontSize: 11,
                          fontWeight: FontWeight.w300),
                    ))
              ],
            ),

            // Expanded(
            //   child: Container(
            //
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(left: 60, right: 10, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                          top: 1.5, left: 11, right: 11, bottom: 1.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xff323232),
                          )),
                      child: Text(
                        widget.docunmentName,
                        style: const TextStyle(
                            color: Color(0xff323232),
                            fontSize: 11,
                            fontWeight: FontWeight.w300),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

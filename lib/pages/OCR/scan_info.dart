import 'package:flutter/material.dart';
import 'dart:io';

import 'package:phr_app/services/storage_service.dart';
import 'package:phr_app/services/firebase_firestore_docs.dart';

//This class is used to show the image taken and fill some detail about the image if OCR is not working
// TODO: in this sheet the data is entered manually and then it uploaded to
// TODO: firebase firestore not the Realtime database because the OCR is not compeleted and it make wrong data and crash the android app
class OCRInfo extends StatefulWidget {
  final File storedImage;
  final String date;
  final String choosenDocunment;
  final File image;

  const OCRInfo(
      {Key? key,
      required this.storedImage,
      required this.choosenDocunment,
      required this.image,
      required this.date})
      : super(key: key);

  @override
  State<OCRInfo> createState() => _OCRInfoState();
}

class _OCRInfoState extends State<OCRInfo> {
  TextEditingController patientController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController doctorController = TextEditingController();

  Future<void> uploadToFirestore(String url) async {
    FirebaseFirestoreDocs firestore = FirebaseFirestoreDocs();
    await firestore.addDocunment(
        patientController.text,
        doctorController.text,
        url,
        widget.date,
        descriptionController.text,
        choosenCategory!,
        widget.choosenDocunment);
  }

  Future<String> uploadImage(String path) async {
    final storage = FirebaseStorageService();
    String url = await storage.uploadImage(path, widget.storedImage);
    print("uploaded");
    return url;
  }

  final formkey = GlobalKey<FormState>();

  String? choosenCategory;
  List<String> categoryType = [
    "Cardiology",
    "ENT",
    "Dental",
    "Medicine",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescription Details",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
        centerTitle: true,
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 5.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          tooltip: 'Back Icon',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
                // isDismissible:false,
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Form(
                          key: formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Patient's Name",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff323232)),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 20,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp('[a-zA-Z]').hasMatch(value)) {
                                      return "Enter valid Patient";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: patientController,
                                  decoration: const InputDecoration(
                                    hintText: 'Patient Name',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff323232)),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 20,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  // validator: (value){
                                  //   if( value!.isEmpty || !RegExp('[a-zA-Z]').hasMatch(value) ){
                                  //     return "Enter valid ";
                                  //   }
                                  //   else
                                  //     return null;
                                  // },

                                  controller: dateController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color(0xffE4DFDF),
                                    //     width: 3,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color(0xffE4DFDF),
                                    //     width: 3,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(15),
                                    // ),
                                    hintText: 'Date',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff323232)),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 20,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp('[a-zA-Z]').hasMatch(value)) {
                                      return "Enter Description";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: descriptionController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color(0xffE4DFDF),
                                    //     width: 3,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color(0xffE4DFDF),
                                    //     width: 3,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(15),
                                    // ),
                                    hintText: 'Description',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Doctor",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff323232)),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 20,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp('[a-zA-Z]').hasMatch(value)) {
                                      return "Enter valid Doctor ";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: doctorController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color(0xffE4DFDF),
                                    //     width: 3,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color(0xffE4DFDF),
                                    //     width: 3,
                                    //   ),
                                    //   borderRadius: BorderRadius.circular(15),
                                    // ),
                                    hintText: 'Doctor Name',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Category",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff323232)),
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField(
                                autofocus: false,
                                decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto),
                                focusColor: Colors.white,
                                value: choosenCategory,
                                style: const TextStyle(color: Colors.white),
                                iconEnabledColor: Colors.black,
                                items: categoryType
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    choosenCategory = value;
                                  });
                                },
                                hint: const Text(
                                  "Category",
                                  style: TextStyle(
                                      color: Color(0xff6C757D), fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton(
                                  child: const Text('Upload'),
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      if (choosenCategory != null) {
                                        int timestamp = DateTime.now()
                                            .millisecondsSinceEpoch;
                                        final filepath = 'uid$timestamp';

                                        String url =
                                            await uploadImage(filepath);

                                        await uploadToFirestore(url);
                                        const scnakbar = SnackBar(
                                          content: Text('Uploaded'),
                                        );
                                        if (mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(scnakbar);
                                          Navigator.pop(context);
                                        }
                                      } else {
                                        const scnakbar = SnackBar(
                                          content: Text('Select category'),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(scnakbar);
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                });

            // Navigator.pop(context);
          },
          child: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: NetworkImage("url"),
            //   )
            // ),
            child: Image.file(
              widget.storedImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}

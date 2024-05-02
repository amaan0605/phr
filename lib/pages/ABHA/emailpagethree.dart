import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/emailpagefive.dart';
import 'package:phr_app/pages/ABHA/emailpagefour.dart';

class Emailpagethree extends StatefulWidget {
  const Emailpagethree({super.key});

  @override
  State<Emailpagethree> createState() => _EmailpagethreeState();
}

class _EmailpagethreeState extends State<Emailpagethree> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobDayController = TextEditingController();
  TextEditingController dobMonthController = TextEditingController();
  TextEditingController dobYearController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  String docId = '';
  bool _isLoading = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    dobDayController.dispose();
    dobMonthController.dispose();
    dobYearController.dispose();
    genderController.dispose();
    emailController.dispose();
    addressController.dispose();
    stateController.dispose();
    pincodeController.dispose();
  }

  Future<void> createDetailsDoc() async {
    setState(() {
      _isLoading = true;
    });
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('Users');

      // DocumentReference documentReference = await collectionReference.add
      await collectionReference.doc(firebaseAuth.currentUser!.uid).set({
        "name": fullNameController.text,
        "dob": Timestamp.fromDate(DateTime(
            int.parse(dobYearController.text),
            int.parse(dobMonthController.text),
            int.parse(dobDayController.text))),
        // dobDayController.text +
        //     dobMonthController.text +
        //     dobYearController.text,
        "gender": genderController.text,
        "email": firebaseAuth.currentUser!.email, //emailController.text ??
        "address": addressController.text,
        "state": stateController.text,
        "pincode": pincodeController.text,
        "password": '',
        "uid": firebaseAuth.currentUser!.uid,
      });
      // docId = documentReference.id;
      // log(docId);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 227, 244),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 227, 244),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.orange,
            onPressed: () {},
          )
        ],
        automaticallyImplyLeading: false,
        elevation: 10,
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset('images/logo.png'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nRegister with Mobile Number',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nFull Name',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 40,
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nDate of Birth',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Container(
                    height: 40,
                    width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      controller: dobDayController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 40,
                    width: 179,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      controller: dobMonthController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                      controller: dobYearController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nGender',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 40,
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: genderController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nEmail ID (Optional)',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 40,
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nAddress',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 40,
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nState',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 40,
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: stateController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nPincode',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 40,
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: pincodeController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: 330,
          child: ElevatedButton(
            onPressed: () async {
              // Handle Continue button click
              if (fullNameController.text.isNotEmpty &&
                  dobDayController.text.isNotEmpty &&
                  dobYearController.text.isNotEmpty &&
                  dobMonthController.text.isNotEmpty &&
                  genderController.text.isNotEmpty &&
                  addressController.text.isNotEmpty &&
                  stateController.text.isNotEmpty &&
                  pincodeController.text.isNotEmpty) {
                await createDetailsDoc();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Emailpagefive(
                          //firestoreDocId: docId,
                          )),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please fill all the required fields')));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : const Text('Continue'),
          ),
        ),
      ),
    );
  }
}

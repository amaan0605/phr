import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// This class is used to get and upload data from firestore firebase
class FirebaseFirestoreDocs {
  static Future<DocumentSnapshot<Object?>> getUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    User? currUser = FirebaseAuth.instance.currentUser;
    return users.doc(currUser?.uid as String).get();
  }

  Future<void> addUser(String name, String email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    User? currUser = FirebaseAuth.instance.currentUser;

    users
        .doc(currUser?.uid as String)
        .set({'name': name, 'email': email, 'mobile': "12345"});

    // Call the user's CollectionReference to add a new user
    // User mana=User(name:name,email:email,mobile:"123");
  }

  Future<void> addDocunment(
      String Patientname,
      String Doctorname,
      String Docunmentlink,
      String date,
      String description,
      String category,
      String DocunmentType) async {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    dynamic users = FirebaseFirestore.instance
        .collection('Documents')
        .doc(path)
        .collection(path);

    users.doc(timestamp.toString()).set({
      'Patientname': Patientname,
      'Doctorname': Doctorname,
      'firebaseStorageUri': Docunmentlink,
      'date': date,
      'description': description,
      'category': DocunmentType,
      'reportType': category
    });

    // Call the user's CollectionReference to add a new user
    // User mana=User(name:name,email:email,mobile:"123");
  }

  Future<void> addappointnment(
      String AppointType, String AppointNote, String Date, String time) async {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    dynamic users = FirebaseFirestore.instance
        .collection('Appointments')
        .doc(path)
        .collection(path);

    users.doc(timestamp.toString()).set({
      'AppointmentType': AppointType,
      'AppointmentNote': AppointNote,
      'Date': Date,
      'Time': time,
      'status': 'Under Process'
    });
  }

  static Stream<QuerySnapshot> getAppointment() async* {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    CollectionReference users =
        FirebaseFirestore.instance.collection('Appointments/$path/$path');
    yield* users.snapshots();
  }

  static Stream<QuerySnapshot> getDocuments() async* {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    CollectionReference users =
        FirebaseFirestore.instance.collection('Documents/$path/$path');
    yield* users.snapshots();
  }
}

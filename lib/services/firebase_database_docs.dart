import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// This class is used to get and upload data from realtime database  of firebase
class FirebaseDatabaseDocs {
  FirebaseDatabase database = FirebaseDatabase.instance;

  // this function add the user to the realtime database
  static Future<void> addUser(String email, String name) async {
    // CollectionReference users = FirebaseFirestore.instance.collection('Users');
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$path");
    await ref.set({"name": name, 'email': email, 'mobile': "123456789"});
  }

  // this function return the user name
  static Future<String> getUser() async {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    DataSnapshot data =
        await FirebaseDatabase.instance.ref("Users/$path").get();
    dynamic abs = data.value! as dynamic;
    print(abs['name']);
    // Map<String,String> map=data.value!;
    return abs['name'];
  }

  // this function update the mobile of the user
  static updateusermobile(String mobile) async {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    DatabaseReference data = FirebaseDatabase.instance.ref("Users/$path");

    await data.update({'mobile': mobile});
  }

  // this function update the name of the user
  static updateusername(String name) async {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    DatabaseReference data = FirebaseDatabase.instance.ref("Users/$path");

    await data.update({"name": name});
  }

  // this function update the email of the user
  static updateuseremail(String email) async {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    DatabaseReference data = FirebaseDatabase.instance.ref("Users/$path");

    await data.update({
      'email': email,
    });
  }

  // this function return the vital using uid of that user
  static Future getVitals() async {
    User? currUser = FirebaseAuth.instance.currentUser;
    String path = currUser?.uid as String;
    DataSnapshot data =
        await FirebaseDatabase.instance.ref("Vitals/$path").get();
    dynamic abs = data.value as dynamic;
    // print(abs['Steps']);

    return abs;
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateCommunityprofile extends StatefulWidget {
  const CreateCommunityprofile({Key? key}) : super(key: key);

  @override
  State<CreateCommunityprofile> createState() => _CreateCommunityprofileState();
}

class _CreateCommunityprofileState extends State<CreateCommunityprofile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  Map<String, dynamic>? _userData;
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    _user = _auth.currentUser;
    if (_user != null) {
      DocumentSnapshot userDataSnapshot =
          await _firestore.collection('Users').doc(_user!.uid).get();
      print(userDataSnapshot.data());
      setState(() {
        _userData = userDataSnapshot.data() as Map<String, dynamic>?;
      });
      print(_user!.uid);
      // print(_userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_userData);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: Center(
        child: _userData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${_userData!['name']}'),
                  Text('Email: ${_userData!['email']}'),
                  // Display other user data fields as needed
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
  // bool agreedToRules = false;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color.fromARGB(255, 189, 227, 244),
  //     appBar: AppBar(
  //       backgroundColor: const Color.fromARGB(255, 189, 227, 244),
  //       actions: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(right: 20),
  //           child: TextButton(
  //             onPressed: () {
  //               // Add functionality for the Rewards button
  //             },
  //             child: Row(
  //               children: [
  //                 Text(
  //                   'Rewards ',
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 Icon(
  //                   Icons.card_giftcard,
  //                   color: Colors.black,
  //                 ),
  //               ],
  //             ),
  //             style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
  //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                 RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30.0),
  //                   side: BorderSide(color: Colors.white),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.account_circle),
  //           color: Colors.orange,
  //           onPressed: () {},
  //         ),
  //       ],
  //       automaticallyImplyLeading: false,
  //       elevation: 10,
  //       leading: Container(
  //         padding: const EdgeInsets.all(5),
  //         child: Image.asset('images/logo.png'),
  //       ),
  //     ),
  //     body: Center(
  //       child: Text(
  //         'My Community Profile',
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.black, // Set font color to black
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Home'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               // Navigate to Communityprofile page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Communityprofile()),
//               );
//             },
//             child: Text('Go to Communityprofile'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

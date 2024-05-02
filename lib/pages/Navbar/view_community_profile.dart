import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/pages/Navbar/create_community_profile.dart';
import 'package:phr_app/services/firebase/firestore_services.dart';

class ViewCommunityprofile extends StatefulWidget {
  const ViewCommunityprofile({Key? key}) : super(key: key);

  @override
  State<ViewCommunityprofile> createState() => _ViewCommunityprofileState();
}

class _ViewCommunityprofileState extends State<ViewCommunityprofile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  Map<String, dynamic>? _userData;

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 227, 244),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 227, 244),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                // Add functionality for the Rewards button
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              child: const Row(
                children: [
                  Text(
                    'Rewards ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.orange,
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
        elevation: 10,
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset('images/logo.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10.0, bottom: 10),
              child: Text(
                'My Community Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset('images/relax.png'),
            ),
            SizedBox(height: 20),
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username:  ${_userData!['name']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Points:  ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Issue of Interest: ${_userData?['issue_of_interest'] ?? 'not specified'} ',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const CreateCommunityprofile()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(double.infinity, 50),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: const Text(
                        'EDIT',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

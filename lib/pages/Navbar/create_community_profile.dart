import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateCommunityprofile extends StatefulWidget {
  const CreateCommunityprofile({Key? key}) : super(key: key);

  @override
  State<CreateCommunityprofile> createState() => _CreateCommunityprofileState();
}

class _CreateCommunityprofileState extends State<CreateCommunityprofile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? _userData;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _issueController = TextEditingController();
  String? selectedAvatarUrl;
  List<String> avatarUrls = [];

  Future<List<String>> fetchAvatarUrls() async {
    Reference reference = FirebaseStorage.instance.ref().child('avatar');
    try {
      ListResult result = await reference.listAll();

      for (Reference ref in result.items) {
        String downloadUrl = await ref.getDownloadURL();
        avatarUrls.add(downloadUrl);
        print(downloadUrl);
      }
    } catch (e) {
      // Handle any errors
      print('Error fetching avatar URLs: $e');
    }

    return avatarUrls;
  }

  Future<void> _fetchAvatarUrls() async {
    List<String> urls = await fetchAvatarUrls();
    setState(() {
      avatarUrls = urls;
    });
  }

  @override
  void initState() {
    super.initState();
    // _getUserData();
    _fetchAvatarUrls();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _issueController.dispose();
    super.dispose();
  }

  Future<void> updateUserData() async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('Users');

      print(_auth.currentUser!.uid);

      await collectionReference.doc(_auth.currentUser!.uid).update({
        'profile_photo': selectedAvatarUrl,
        'name': _usernameController.text,
        'issue_of_interest': _issueController.text
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data Updated Succesfully!')));
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  // Future<void> _getUserData() async {
  //   _user = _auth.currentUser;
  //   if (_user != null) {
  //     DocumentSnapshot userDataSnapshot =
  //         await _firestore.collection('Users').doc(_user!.uid).get();

  //     setState(() {
  //       _userData = userDataSnapshot.data() as Map<String, dynamic>?;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 227, 244),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 227, 244),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
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
      body: _userData == null && avatarUrls.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
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
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10.0, bottom: 10),
                      child: Text(
                        'Pick Your Avatar',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Adjust as needed
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: avatarUrls.length,
                      itemBuilder: (context, index) {
                        String avatarUrl = avatarUrls[index];
                        return GestureDetector(
                            onTap: () async {
                              setState(() {
                                selectedAvatarUrl = avatarUrl;
                              });
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(avatarUrl),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedAvatarUrl == avatarUrl
                                        ? Colors.blue.withOpacity(
                                            0.5) // Highlight selected avatar
                                        : null,
                                    borderRadius: BorderRadius.circular(60)),
                              ),
                            ));
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: screenSize.height * .36,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 10, left: 10),
                                    hintText: 'Enter Username',
                                    hintStyle:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 219, 226, 229),
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Issue of Interest',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: _issueController,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 10, left: 10),
                                    hintText: 'Enter Discussion Type',
                                    hintStyle:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 219, 226, 229),
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          Size(screenSize.width * .4, 50),
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  child: const Text(
                                    'X  CANCEL',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    await updateUserData();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffE26649),
                                      minimumSize:
                                          Size(screenSize.width * .4, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  child: const Text(
                                    'DONE',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

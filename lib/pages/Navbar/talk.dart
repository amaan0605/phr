import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/pages/chat/chat_page.dart';
import 'package:phr_app/services/firebase/firestore_services.dart';

class Talk extends StatefulWidget {
  const Talk({super.key});

  @override
  State<Talk> createState() => _TalkState();
}

class _TalkState extends State<Talk> {
  final FirestoreService _firestoreService = FirestoreService();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Padding(
            padding: const EdgeInsets.all(24),
            child: StreamBuilder(
              stream: _firestoreService.getChatUser(),
              builder: (context, snapshot) {
                //Error
                if (snapshot.hasError) {
                  return const Text("error");
                }
                //Loading
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                //Chat user List

                return ListView(
                  children: snapshot.data!
                      .map<Widget>(
                          (userData) => _buildUserListItem(userData, context))
                      .toList(),
                );
              },
            )));
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != auth.currentUser!.email) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListTile(
          minVerticalPadding: 20,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          tileColor: Colors.orange,
          leading: CircleAvatar(
            child: Image.network(userData['image'] ??
                'https://cdn-icons-png.flaticon.com/512/10337/10337609.png'),
          ),
          title: Text(
            userData['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.navigate_next),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ChatPage(
                        recieverId: userData['uid'],
                      )))),
        ),
      );
    } else {
      return Container();
    }
  }
}

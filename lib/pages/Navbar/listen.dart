import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/pages/chat/chat_page.dart';
import 'package:phr_app/services/firebase/firestore_services.dart';

class Listen extends StatefulWidget {
  const Listen({super.key});

  @override
  State<Listen> createState() => _ListenState();
}

class _ListenState extends State<Listen> {
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
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
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

    // FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            //     future: FirebaseFirestore.instance
            //         .collection("WaitingRoomChat")
            //         .where("for", isEqualTo: "talk")
            //         .get(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return const Center(child: CircularProgressIndicator());
            //       } else if (snapshot.hasError) {
            //         return Center(
            //           child: Text(snapshot.error.toString()),
            //         );
            //       }

            //       final userList = snapshot.data!.docs;

            //       if (userList.isEmpty) {
            //         return const Center(child: Text("No user to talk"));
            //       }

            //       return ListView.builder(
            //           itemCount: userList.length,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               tileColor: Colors.grey,
            //               leading: CircleAvatar(
            //                   child: Image.network(
            //                       userList[index].data()['image'])),
            //               title: Text(userList[index].data()["name"]),
            //               trailing: const Icon(Icons.navigate_next),
            //             );
            //           });
            //     })));
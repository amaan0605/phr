import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/services/firebase/firestore_services.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.recieverId});

  final String recieverId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_chatController.text.isNotEmpty) {
      await _firestoreService.sendMessage(
          widget.recieverId, _chatController.text);
      _chatController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    String senderId = _auth.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream:
                  _firestoreService.getMessages(widget.recieverId, senderId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  const Text('Error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView(
                  children: snapshot.data!.docs
                      .map((doc) => _buildMessageItem(doc))
                      .toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatController,
                    decoration: const InputDecoration(
                        hintText: 'Type your message',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
                IconButton(onPressed: sendMessage, icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == _auth.currentUser!.uid;

    return Container(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2.5),
                decoration: BoxDecoration(
                    color: isCurrentUser ? Colors.orange : Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  data["message"],
                  style: const TextStyle(color: Colors.white),
                )),
          ],
        ));
  }
}

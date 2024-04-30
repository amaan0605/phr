import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/create_abha_two.dart';

class CreateAbhaID extends StatefulWidget {
  const CreateAbhaID({super.key});

  @override
  State<CreateAbhaID> createState() => _CreateAbhaIDState();
}

class _CreateAbhaIDState extends State<CreateAbhaID> {
  TextEditingController abhaNumberController = TextEditingController();

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
                '\nCreate ABHA Number',
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
                '\nEnter Aadhar Number',
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
                height: 30,
                width: 325,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: TextField(
                  controller: abhaNumberController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ]))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: 330,
          child: ElevatedButton(
            onPressed: () {
              // Handle Continue button click
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateAbhaone()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Text('Continue'),
          ),
        ),
      ),
    );
  }
}

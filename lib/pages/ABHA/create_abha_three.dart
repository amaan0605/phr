import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/Registration/abha_page_two.dart';

class CreateAbhathree extends StatefulWidget {
  const CreateAbhathree({super.key});

  @override
  State<CreateAbhathree> createState() => _CreateAbhathreeState();
}

class _CreateAbhathreeState extends State<CreateAbhathree> {
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
      body: const SafeArea(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '\nABHA Number created!',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '\nYour ABHA Number is',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ]))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: 325,
          child: ElevatedButton(
            onPressed: () {
              // Handle Continue button click
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Abhapagetwo()),
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

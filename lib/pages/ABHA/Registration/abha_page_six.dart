import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/loginone.dart';

class Abhapagesix extends StatefulWidget {
  const Abhapagesix({super.key});

  @override
  State<Abhapagesix> createState() => _AbhapagesixState();
}

class _AbhapagesixState extends State<Abhapagesix> {
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
                  '\nCongratulations',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nAccount has been created click on login to continue',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: 355,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Loginone()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}

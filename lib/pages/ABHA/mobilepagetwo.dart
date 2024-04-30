// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/mobilepagethree.dart';
import 'package:pinput/pinput.dart';

class Mobilepagetwo extends StatefulWidget {
  const Mobilepagetwo({Key? key, required this.verificationId})
      : super(key: key);

  final String verificationId;

  @override
  State<Mobilepagetwo> createState() => _MobilepagetwoState();
}

class _MobilepagetwoState extends State<Mobilepagetwo> {
  List<TextEditingController> mobileNumberControllers = List.generate(
      6, (index) => TextEditingController()); // List of controllers for 6 boxes
  var otpCode = '';
  void _signIn() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otpCode);

    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Mobilepagethree()),
        );
      });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

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
                  '\nRegister with Mobile Number',
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
                  '\nEnter OTP',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Pinput(
                    length: 6,
                    onChanged: ((value) {
                      otpCode = value;
                    }),
                  )
                  // Row(
                  //   children: List.generate(
                  //     6,
                  //     (index) => Container(
                  //       height: 50,
                  //       width: 45,
                  //       margin: const EdgeInsets.only(right: 10),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.black),
                  //       ),
                  //       child: TextField(
                  //         controller: mobileNumberControllers[index],
                  //         keyboardType: TextInputType.number,
                  //         textAlign: TextAlign.center,
                  //         maxLength: 1,
                  //         decoration: const InputDecoration(
                  //           counterText: '',
                  //           border: InputBorder.none,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: 330,
          child: ElevatedButton(
            onPressed: () {
              // Handle Continue button click
              _signIn();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const Mobilepagethree()),
              // );
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

  @override
  void dispose() {
    for (var controller in mobileNumberControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class CreateAbha extends StatelessWidget {
  const CreateAbha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create ABHA Number'),
      ),
      body: const Center(
        child: Text('This is the CreateAbha page.'),
      ),
    );
  }
}

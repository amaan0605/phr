// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phr_app/pages/ABHA/emailpagethree.dart';
import 'package:phr_app/pages/ABHA/emailpagetwo.dart';
import 'package:email_otp/email_otp.dart';
import 'package:phr_app/pages/ABHA/mobilepagethree.dart';
import 'package:phr_app/services/firebase/auth_services.dart';
import 'package:pinput/pinput.dart';

class Emailpageone extends StatefulWidget {
  const Emailpageone({super.key});

  @override
  State<Emailpageone> createState() => _EmailpageoneState();
}

class _EmailpageoneState extends State<Emailpageone> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService authService = AuthService();
  // String otpCode = '';

  // Future<void> _sendOTP() async {
  //   try {
  //     await _auth.sendSignInLinkToEmail(
  //       email: emailController.text,
  //       actionCodeSettings: ActionCodeSettings(
  //         url: 'https://test2-2769e.firebaseapp.com',
  //         handleCodeInApp: true,
  //       ),
  //     );
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // Future<void> _signInWithEmailAndOTP() async {
  //   try {
  //     final UserCredential userCredential = await _auth.signInWithEmailLink(
  //       email: emailController.text,
  //       emailLink: otpController.text,
  //     );

  //     final User? user = userCredential.user;
  //     if (user != null) {
  //       log('Successfully signed in: ${user.uid}');
  //       print('Successfully signed in: ${user.uid}');
  //       // Navigate to next screen or perform necessary actions
  //     } else {
  //       log('Failed to sign in');
  //       print('Failed to sign in');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     print('Error: $e');
  //   }
  // }

  //EmailOTP myauth = EmailOTP();

  // void sendOtp() async {
  //   myauth.setConfig(
  //       appEmail: "amaans70076@gmail.com",
  //       appName: "Email OTP",
  //       userEmail: emailController.text,
  //       otpLength: 6,
  //       otpType: OTPType.digitsOnly);
  //   if (await myauth.sendOTP() == true) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("OTP has been sent"),
  //     ));
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: ((context) => const Emailpagetwo())));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Oops, OTP send failed"),
  //     ));
  //   }
  // }

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
                  '\nRegister with E-mail ID',
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
                  '\nEnter E-mail ID',
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
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nEnter Your Password',
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
                  width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
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
            onPressed: () async {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                final message = await AuthService().registration(
                  email: emailController.text,
                  password: passwordController.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Emailpagethree()));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please enter required fields!')));
              }
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

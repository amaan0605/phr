// ignore_for_file: slash_for_doc_comments

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phr_app/constants.dart';
import 'package:phr_app/pages/ABHA/abha_webview_registration.dart';
import 'package:phr_app/services/app_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:phr_app/pages/Signup/signup.dart';

import '../Navbar/navigationpage.dart';
import '../Login/login_controller.dart';

class ABHALogin extends StatefulWidget {
  const ABHALogin({Key? key}) : super(key: key);

  @override
  State<ABHALogin> createState() => _ABHALoginState();
}

// it is login page .In this it take user emailaddress and password and check the credentials using firebase .
// You can see the function loginemail() in this class which is used to call the  function loginwithemail in class  FirebaseAuthen
//There is a singup named text button which navigate to singup page you can find the singup page in sineup directory
//there are buttons like login with apple which have onPressed function which do not do anything
class _ABHALoginState extends State<ABHALogin> {
  final healthIDController = TextEditingController();
  final otpController = TextEditingController();
  final loginInitController = Get.put(LoginInitController());
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  var txnID = "";

  login() async {
    log(name: "login resp", loginInitController.getLoginResponse().toString());
    if (otpController.text.isNotEmpty && otpController.text.length == 6) {
      try {
        assert(loginInitController.getLoginResponse() != null);
        final loginResponse = await loginInitController.postOTPConfirm(
          otp: otpController.text,
          txnId: loginInitController.getLoginResponse()!.txnId!,
        );
        final profile =
            await loginInitController.getProfile(loginResponse.token!);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(spProfileKey, jsonEncode(profile.toJson()));
        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NavPage()),
            (route) => false,
          );
        }
      } on FetchDataException catch (e) {
        log(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Unknown Error")),
        );
        return;
      } on AssertionError catch (e) {
        log(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please generate the OTP first")),
        );
        return;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid OTP')),
      );
    }
  }

  Future<void> getOTP() async {
    loginInitController.refresh();
    log("getOTP");
    healthIDController.text = healthIDController.text.trim();
    var msg = 'The OTP is sent to your registered mobile';
    if (healthIDController.text.length > 8) {
      log("HI");
      try {
        await loginInitController.postInitAuth(
            loginDetails:
                LoginInitRequestModel(healthid: healthIDController.text));
        assert(loginInitController.getLoginResponse() != null);
      } on FetchDataException catch (e) {
        log(e.toString());
        msg = e.message ?? "Unknown Error";
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg)),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid Health ID or OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double gradient = 0.16 * height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // upper gradients
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 0.16 * height,
                  width: width / 2.1,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xffB9DAFB).withOpacity(0.5),
                            const Color(0xffF5F5F5),
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(gradient))),
                ),
                Container(
                  height: 0.16 * height,
                  width: width / 2.1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          const Color(0xffB9DAFB).withOpacity(0.5),
                          const Color(0xffF5F5F5),
                        ]),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(gradient),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.only(left: 25),
              height: 0.073 * height,
              padding: EdgeInsets.only(
                top: 0.003 * height,
                left: 4,
                bottom: 0.003 * height,
                right: 4,
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 0.05 * height,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff120D26)),
              ),
            ),

            SizedBox(height: 0.05 * height),

            Container(
              height: 0.067 * height,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: healthIDController,
                // only digits
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.person),
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE4DFDF),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE4DFDF),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Health ID',
                ),
              ),
            ),

            SizedBox(height: 0.024 * height),

            // OTP and get OTP Buttton
            SizedBox(
              height: 0.067 * height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 0.5 * width,
                    child: TextFormField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.lock),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffE4DFDF),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffE4DFDF),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'OTP',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.3 * width,
                    height: 0.067 * height,
                    child: TextButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        await getOTP();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xff5669FF),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xff5669FF),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Get OTP',
                        style: TextStyle(
                          fontSize: 0.02 * height,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 0.024 * height),

            SizedBox(
              height: 0.035 * height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          fontSize: 0.0145 * height,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 0.0145 * height,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 0.024 * height),

            //Signin buttom
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              height: 0.07 * height,
              child: TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await login();
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff5669FF),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xff5669FF),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'Sign in with ABHA',
                      style: TextStyle(
                        fontSize: 0.02 * height,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    CircleAvatar(
                      radius: 0.017 * height,
                      backgroundColor: const Color(0xff3D56F0),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
/*
            SizedBox(height: 0.028 * height),
            Center(
              child: Text(
                'OR',
                style: TextStyle(
                  fontSize: height * 0.02,
                  color: const Color(0xff9D9898),
                ),
              ),
            ),
            SizedBox(height: 0.02 * height),

            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              height: 0.067 * height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ABHALogin()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sign in with ABHA',
                      style: TextStyle(
                          fontSize: 0.02 * height, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.031 * height),
*/
            // Signup
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?  ',
                  style: TextStyle(fontSize: 0.018 * height),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        // const SingUp()
                        return const WebViewRegistration();
                      }));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 0.018 * height,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff5669FF)),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

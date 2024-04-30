import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/abha_login.dart';
import 'package:phr_app/pages/Signup/signup.dart';
import 'package:phr_app/services/firebase_auth.dart';

import '../Navbar/navigationpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// it is login page .In this it take user emailaddress and password and check the credentials using firebase .
// You can see the function loginemail() in this class which is used to call the  function loginwithemail in class  FirebaseAuthen
//There is a singup named text button which navigate to singup page you can find the singup page in sineup directory
//there are buttons like login with apple which have onPressed function which do not do anything
class _LoginPageState extends State<LoginPage> {
  bool _showpassword = false;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  Future<void> loginemail() async {
    await FirebaseAuthen(FirebaseAuth.instance).loginwithemail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
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
                            // Color(0xffECACAD).withOpacity(0.5),
                            // Color(0xff9895EE).withOpacity(0.5),
                            // Color(0xff90A2F8).withOpacity(0.5),
                            // Color(0xffC55492B).withOpacity(0.5),
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
                            // Color(0xffECACAD).withOpacity(0.5),
                            // Color(0xff9895EE).withOpacity(0.5),
                            // Color(0xff90A2F8).withOpacity(0.5),
                            // Color(0xffC55492B).withOpacity(0.5),
                            const Color(0xffF5F5F5),
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(gradient))),
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
                  right: 4),
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
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.email_outlined),
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
                  hintText: 'abc@gmail.com',
                ),
              ),
            ),

            SizedBox(
              height: 0.024 * height,
            ),
            Container(
              height: 0.067 * height,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: passwordController,
                obscureText: !_showpassword,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.lock_outline),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _showpassword ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xff979797),
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _showpassword = !_showpassword;
                      });
                    },
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
                  hintText: 'Your password',
                ),
              ),
            ),

            SizedBox(
              height: 0.024 * height,
            ),

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
                            color: Colors.black),
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
                            color: Colors.black),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 0.024 * height,
            ),

            //Signin buttom
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              height: 0.07 * height,
              child: TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await loginemail();
                  if (mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const NavPage()),
                      (route) => false,
                    );
                  }
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
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 0.025 * height,
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

            SizedBox(
              height: 0.028 * height,
            ),
            Center(
              child: Text(
                'OR',
                style: TextStyle(
                    fontSize: height * 0.02, color: const Color(0xff9D9898)),
              ),
            ),
            SizedBox(
              height: 0.02 * height,
            ),

            // login with google
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              color: Colors.white,
              height: 0.067 * height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Sign-in with Google',
                      style: TextStyle(
                          fontSize: 0.02 * height,
                          color: const Color(0xff120D26)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.029 * height,
            ),

            //login with apple
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              height: 0.067 * height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.apple_outlined,
                      size: 0.04 * height,
                    ),
                    Text(
                      'Sign in with Apple',
                      style: TextStyle(
                          fontSize: 0.02 * height, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.031 * height,
            ),

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
            SizedBox(
              height: 0.031 * height,
            ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SingUp()));
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

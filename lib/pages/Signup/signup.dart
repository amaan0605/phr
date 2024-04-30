import 'package:flutter/material.dart';

import 'package:phr_app/services/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../services/firebase_database_docs.dart';
import '../../services/firebase_firestore_docs.dart';
import '../Navbar/navigationpage.dart';

// it is Signup page .In this it take user emailaddress and password and name and upload the credentials using firebase .
//There is a function in this class which upload email address and name to realtime database using createUser() in  FirebaseDatabaseDocs class
// You can see the function Singupfirebase() in this class which is used to call the  function Singupfirebase in class  FirebaseAuthen
//there is Input check using form so they are checking each input
class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final scaffoldkey = GlobalKey<ScaffoldState>();

  bool _showpassword = false;
  bool _showConpassword = false;
  final passwordController = TextEditingController();
  final conpasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  void createUser() async {
    FirebaseFirestoreDocs firestore = FirebaseFirestoreDocs();
    await firestore.addUser(nameController.text, emailController.text);
    await FirebaseDatabaseDocs.addUser(
        emailController.text, nameController.text);
  }

  Future<void> singupfirebase() async {
    print("In sing up");
    // print(emailController.text);
    // print(passwordController.text);
    await FirebaseAuthen(FirebaseAuth.instance).singupwithemail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin:
                    EdgeInsets.only(left: 30, top: 0.05 * height, bottom: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  iconSize: 20,
                )),

            //Text
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
                'Create Your',
                style: TextStyle(
                  fontSize: 0.05 * height,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff120D26),
                ),
              ),
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
                'Account',
                style: TextStyle(
                  fontSize: 0.05 * height,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff120D26),
                ),
              ),
            ),

            SizedBox(height: 0.058 * height),
            //Name text field
            Container(
              height: 0.067 * height,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty || !RegExp('[a-zA-Z]').hasMatch(value)) {
                    return "Enter valid name";
                  } else {
                    return null;
                  }
                },
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.perm_identity_sharp),
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
                  hintText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 0.024 * height,
            ),
            //Email text field
            Container(
              height: 0.067 * height,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                validator: (value) {
                  print(value);
                  if (value!.isEmpty ||
                      !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Enter valid Email";
                  } else {
                    return null;
                  }
                },
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
            //Password text field
            Container(
              height: 0.067 * height,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                    return "Enter valid Password";
                  } else {
                    return null;
                  }
                },
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
            //Conform Password text field
            Container(
              height: 0.067 * height,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                    return "Enter valid Password";
                  } else {
                    return null;
                  }
                },
                controller: conpasswordController,
                obscureText: !_showConpassword,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.lock_outline),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _showConpassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff979797),
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _showConpassword = !_showConpassword;
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
                  hintText: 'Confirm password',
                ),
              ),
            ),
            SizedBox(
              height: 0.044 * height,
            ),

            //Sign up button
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              height: 0.07 * height,
              child: TextButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    if (passwordController.value ==
                        conpasswordController.value) {
                      await singupfirebase();
                      createUser();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavPage()),
                          (route) => false);
                    } else {
                      const scnakbar = SnackBar(
                        content: Text('Confirm password does not match'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                    }
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
                      'Sign up',
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
          ],
        ),
      ),
    );
  }
}

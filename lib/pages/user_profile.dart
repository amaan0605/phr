import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/pages/Appointment/appointnment.dart';
import 'package:phr_app/pages/ABHA/abha_login.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  const ProfilePage({Key? key, required this.name}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

//It is class of simple widgets and button
class _ProfilePageState extends State<ProfilePage> {
  late String name = "sks kw ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        padding: const EdgeInsets.only(left: 36, top: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.cancel,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xff5669FF),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset('images/ProfilePhoto.png'),
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 26,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Appointnment()));
              },
              child: const Row(
                children: [
                  Icon(Icons.date_range_outlined),
                  SizedBox(
                    width: 11,
                  ),
                  Text(
                    "Appointments",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3D3D3D)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            const Row(
              children: [
                Icon(Icons.paste),
                SizedBox(
                  width: 11,
                ),
                Text(
                  "Guidelines",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3D3D3D)),
                )
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            const Row(
              children: [
                Icon(Icons.insert_comment_sharp),
                SizedBox(
                  width: 11,
                ),
                Text(
                  "Feedback",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3D3D3D)),
                )
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            const Row(
              children: [
                Icon(Icons.share),
                SizedBox(
                  width: 11,
                ),
                Text(
                  "Share Transformation",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3D3D3D)),
                )
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 11,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3D3D3D)),
                )
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            const Row(
              children: [
                Icon(Icons.add_comment_rounded),
                SizedBox(
                  width: 11,
                ),
                Text(
                  "Connect A Device",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3D3D3D)),
                )
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 50),
              height: 0.07 * height,
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const ABHALogin()),
                      (route) => false);
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
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 0.02 * height,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

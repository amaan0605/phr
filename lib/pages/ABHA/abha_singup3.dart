import 'package:flutter/material.dart';

class ABHASingup3 extends StatefulWidget {
  const ABHASingup3({Key? key}) : super(key: key);

  @override
  State<ABHASingup3> createState() => _ABHASingup3State();
}

class _ABHASingup3State extends State<ABHASingup3> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.waving_hand,
                  color: Colors.yellow,
                  size: 35,
                )
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              "We are glad that you choose us!",
              style: TextStyle(
                  color: Colors.black12,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            const Center(
              child: Text(
                'Create Your ABHA ID',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

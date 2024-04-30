import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/abha_profilepage.dart';

class ABHAHomePage extends StatefulWidget {
  // Uncomment the following line
  final Map<String, String> user;
  const ABHAHomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ABHAHomePage> createState() => _ABHAHomePageState();
}

class _ABHAHomePageState extends State<ABHAHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, right: 20, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 20),
                        child: const Text(
                          "Hi,",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                            color: Color(0xff112C41),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 20),
                        child: Text(
                          "${widget.user['firstName']},",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                            color: Color(0xff112C41),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ABHAprofilePage(user: widget.user),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color(0xff5669FF),
                      radius: 27,
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/homepageImage.png"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffC0D3FF),
                    borderRadius: BorderRadius.circular(16),
                    border:
                        Border.all(color: const Color(0xffC0D3FF), width: 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(9),
                        height: 55,
                        width: 125,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/TestTubes.png"),
                          ),
                        ),
                      ),
                      const Text(
                        "Medical Timeline",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xff112C41),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffC0D3FF),
                    borderRadius: BorderRadius.circular(16),
                    border:
                        Border.all(color: const Color(0xffC0D3FF), width: 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(9),
                        height: 55,
                        width: 125,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/paperImage.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        "My account",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xff112C41),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

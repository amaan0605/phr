import 'package:flutter/material.dart';

class ABHAsingup2 extends StatefulWidget {
  const ABHAsingup2({Key? key}) : super(key: key);

  @override
  State<ABHAsingup2> createState() => _ABHAsingup2State();
}

class _ABHAsingup2State extends State<ABHAsingup2> {
  final aadharController = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            SizedBox(
              height: height * 0.07,
            ),
            const Text(
              'Step 2/3: Verify your Aadhar',
              style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 0.09 * height,
              // margin: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length != 12) {
                    return "Enter valid aadhar";
                  } else {
                    return null;
                  }
                },
                controller: aadharController,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.phone),
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
                  hintText: 'Mobile',
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.09 * height,
                  width: 0.3 * height,
                  // margin: EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    validator: (value) {
                      return null;
                    },
                    controller: otpController,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.key),
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
                const SizedBox(
                  width: 7,
                ),
                Container(
                  height: 0.07 * height,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: TextButton(
                      onPressed: () {},

                      // style: TextButton.styleFrom(
                      //   foregroundColor: Colors.black26,
                      // ),

                      child: const Text(
                        'GET OTP',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      )),
                )
              ],
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Center(
              child: Container(
                width: 0.6 * width,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                ),
                child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black26,
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Verify Otp',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.black26,
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

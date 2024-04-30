import 'package:flutter/material.dart';

class FeedSecond extends StatefulWidget {
  const FeedSecond({Key? key}) : super(key: key);

  @override
  State<FeedSecond> createState() => _FeedSecondState();
}

class _FeedSecondState extends State<FeedSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 189, 227, 244),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 189, 227, 244),
            title: const Text("Sahasra.AI"),
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
            )),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
            const Row(children: [
              SizedBox(width: 20),
              Text(
                '\nRecommended reads',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              )
            ]),
            const SizedBox(height: 20),
            Column(children: [
              Container(
                decoration: const BoxDecoration(),
                // margin: const EdgeInsets.all(15),
                height: 249.3,
                width: 375,
                alignment: Alignment.center,
                child: Image.asset('images/an.png'),
              ),
            ]),
            const SizedBox(height: 0),
            Column(children: [
              Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  height: 1000,
                  width: 368,
                  child: const Column(
                    children: [
                      Text(
                        "\n 1.   Keep physically active: \n       Develop a routine so that you're physically \n       active most days of the week. Exercise is a \n       powerful stress reducer. It can improve your \n       mood and help you stay healthy. Start out \n       slowly, and gradually increase the amount \n       and intensity of your activities.  ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\n 2.   Keep physically active: \n       Develop a routine so that you're physically \n       active most days of the week. Exercise is a \n       powerful stress reducer. It can improve your \n       mood and help you stay healthy. Start out \n       slowly, and gradually increase the amount \n       and intensity of your activities.  ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\n 3.   Keep physically active: \n       Develop a routine so that you're physically \n       active most days of the week. Exercise is a \n       powerful stress reducer. It can improve your \n       mood and help you stay healthy. Start out \n       slowly, and gradually increase the amount \n       and intensity of your activities.  ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\n 4.   Keep physically active: \n       Develop a routine so that you're physically \n       active most days of the week. Exercise is a \n       powerful stress reducer. It can improve your \n       mood and help you stay healthy. Start out \n       slowly, and gradually increase the amount \n       and intensity of your activities.  ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\n 5.   Keep physically active: \n       Develop a routine so that you're physically \n       active most days of the week. Exercise is a \n       powerful stress reducer. It can improve your \n       mood and help you stay healthy. Start out \n       slowly, and gradually increase the amount \n       and intensity of your activities.  ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\n 6.   Keep physically active: \n       Develop a routine so that you're physically \n       active most days of the week. Exercise is a \n       powerful stress reducer. It can improve your \n       mood and help you stay healthy. Start out \n       slowly, and gradually increase the amount \n       and intensity of your activities.  ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ))
            ]),
          ])),
        ));
  }
}

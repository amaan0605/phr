import 'package:flutter/material.dart';
import 'feed_second.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 189, 227, 244),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 189, 227, 244),
            // title: const Text("Sahasra.AI"),
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
          const SizedBox(
            height: 20,
          ),
          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ]),
          // const SizedBox(
          //   height: 2,
          // ),
          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ]),

          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ]),
          // const SizedBox(
          //   height: 20,
          // ),
          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ]),
          // const SizedBox(
          //   height: 20,
          // ),
          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ]),
          // const SizedBox(
          //   height: 20,
          // ),
          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ]),
          // const SizedBox(
          //   height: 20,
          // ),
          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ]),
          // const SizedBox(
          //   height: 20,
          // ),
          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ]),
          // const SizedBox(
          //   height: 10,
          // ),
          Wrap(children: [
            // SizedBox(width: 10),
            Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedSecond()));
                },
                splashColor: Colors.black,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    margin: const EdgeInsets.all(10),
                    height: 84,
                    width: 390,
                    child: Image.asset('images/1.png')),
              )
            ])
          ])
        ]))));
  }
}

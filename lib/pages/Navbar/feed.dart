import 'package:flutter/material.dart';
import 'package:phr_app/pages/Navbar/articles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feed_second.dart';
import 'edit.dart';

// ignore: camel_case_types
class feedpage extends StatefulWidget {
  const feedpage({super.key});

  @override
  State<feedpage> createState() => _feedpageState();
}

// ignore: camel_case_types
class _feedpageState extends State<feedpage> {
  Future<List<String>>? _list;

  @override
  void initState() {
    _list = getList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: _list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            List<String> editList = snapshot.data ?? [];
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
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(children: [
                        Column(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 189, 227, 244),
                                ),
                                margin: const EdgeInsets.only(left: 10),
                                height: 30,
                                width: 166,
                                child: const Center(
                                    child: Text(' Interested Topics',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)))),
                          ],
                        ),
                        const SizedBox(
                          width: 130,
                        ),
                        Column(
                          children: [
                            Column(children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const EditPage()));
                                  },
                                  splashColor: Colors.black,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 189, 227, 244),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                      width: 45,
                                      child: const Center(
                                          child: Column(
                                        children: [
                                          Text('Edit',
                                              style: TextStyle(fontSize: 20)),
                                        ],
                                      )))),
                            ]),
                          ],
                        )
                      ]),

                      //editList wrap widget
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 10,
                        children: editList.map((val) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Articles()));
                              },
                              splashColor: Colors.black,
                              child: Container(
                                height: 25,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(val),
                              ));
                        }).toList(),
                      ),
                    ],
                  ),
                  const Wrap(children: [
                    SizedBox(width: 20),
                    Text(
                      '\nLocal news',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400),
                    )
                  ]),
                  const SizedBox(height: 20),
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
                ]))));
          }
        });
  }

  Future<List<String>> getList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp = prefs.getStringList("editList")!.toList();
    return temp;
  }

  void emptyList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("editList");
  }
}

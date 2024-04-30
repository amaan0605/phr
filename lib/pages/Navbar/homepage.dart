import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phr_app/services/local_prefs.dart';

import '../../services/firebase_database_docs.dart';
import '../user_profile.dart';

//This is the home page of the app .This page contain some widget and and some button which is used to navigate to other pages.
//This page show the name of the user using future builder  by calling function  FirebaseDatabaseDocs.getUser()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name = "harsh";
  final searchController = TextEditingController();

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
        body: SafeArea(
          child: FutureBuilder<String>(
            future: FirebaseDatabaseDocs.getUser(),
            builder: (ctx, snapshot) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 30, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final user = snapshot.data ?? 'Unknown';
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfilePage(name: user)));
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff5669FF),
                              radius: 27,
                              child: Image.asset('images/Avatar.png'),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              final profile = await getLocalAbhaProfile();
                              log(profile?.name ?? 'null', name: 'profile');
                            },
                            icon: const Icon(Icons.notifications),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                        margin: const EdgeInsets.only(left: 30, right: 20),
                        child: Text(
                          "Hi, ${snapshot.data ?? 'Unknown'}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                              color: Color(0xff112C41)),
                        )),
                    const SizedBox(height: 24),
                    Container(
                      height: 0.067 * height,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.search),
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/ApointPagePhoto.png"))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color(0xffC0D3FF),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: const Color(0xffC0D3FF), width: 1)),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(9),
                                height: 55,
                                width: 125,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "images/TestTubes.png"))),
                              ),
                              const Text("Medical Timeline",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Color(0xff112C41)))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color(0xffC0D3FF),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: const Color(0xffC0D3FF), width: 1)),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(9),
                                height: 55,
                                width: 125,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/paperImage.png"),
                                        fit: BoxFit.cover)),
                              ),
                              const Text("My account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Color(0xff112C41)))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}

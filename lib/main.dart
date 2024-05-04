import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/Registration/abha_page_one.dart';
import 'package:phr_app/pages/ABHA/abha_homepage.dart';
import 'package:phr_app/pages/ABHA/loginone.dart';
import 'package:phr_app/pages/ABHA/mobilepageone.dart';
import 'package:phr_app/pages/ABHA/mobilepagethree.dart';
import 'package:phr_app/pages/Navbar/communitypageone.dart';
import 'package:phr_app/pages/Navbar/navigationpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:phr_app/pages/Navbar/chat.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'test2-2769e',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHR App',
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: const Mobilepagethree(),
      home: const MainPage(),
      // home: const CommunityPageOne()
      // home: const MyApp(),
      // home: const ABHAHomePage()
      // home: ABHAHomePage(user: yourUserMap)
      // home: const Abhapageone(),
      // home: const Coom()
    );
  }

  void initializeEditScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("editList", []);
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const NavPage();
            } else {
              return const Loginone();
            }
          }),
    );
  }
}

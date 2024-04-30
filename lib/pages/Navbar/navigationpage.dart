import 'package:flutter/material.dart';
import 'package:phr_app/pages/Navbar/account_detail.dart';
// import 'package:phr_app/pages/Navbar/chat.dart';
import 'package:phr_app/pages/Navbar/communitypageone.dart';
import 'package:phr_app/pages/Navbar/feed.dart';
// import 'package:phr_app/pages/Navbar/feed.dart';
import 'package:phr_app/pages/Navbar/homepage.dart';
import 'package:phr_app/pages/Navbar/scan.dart';

// import 'package:phr_app/pages/Navbar/fed.dart';
import '../VisualTimeline/medicaltimeline.dart';

// import 'feed.dart';

//It the the page where we are directed after login. in this page you can see the BottomNavigationBar
// which is used as navigation and all 4 class mention in pages list.

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const ScanFilePage(),
    const Medicaltimeline(),
    const AccountPage(),
    const feedpage(),
    const CommunityPageOne(),
    // MyApp()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme:
              const IconThemeData(color: Color(0xff112C41), size: 40),
          backgroundColor: const Color(0xffEEF3FF),
          iconSize: 40,
          unselectedIconTheme:
              const IconThemeData(color: Color(0xff828282), size: 40),

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_sharp),
              label: 'Timeline',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'chat',
            )
          ],

          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

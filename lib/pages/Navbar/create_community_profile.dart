import 'package:flutter/material.dart';

class Communityprofile extends StatefulWidget {
  const Communityprofile({Key? key}) : super(key: key);

  @override
  State<Communityprofile> createState() => _CommunityprofileState();
}

class _CommunityprofileState extends State<Communityprofile> {
  bool agreedToRules = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 227, 244),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 227, 244),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                // Add functionality for the Rewards button
              },
              child: Row(
                children: [
                  Text(
                    'Rewards ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.black,
                  ),
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.orange,
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
        elevation: 10,
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset('images/logo.png'),
        ),
      ),
      body: Center(
        child: Text(
          'My Community Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Set font color to black
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigate to Communityprofile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Communityprofile()),
              );
            },
            child: Text('Go to Communityprofile'),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

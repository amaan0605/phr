import 'package:flutter/material.dart';
import 'package:phr_app/pages/Navbar/communitypageone.dart';

class Coom extends StatefulWidget {
  const Coom({Key? key}) : super(key: key);

  @override
  State<Coom> createState() => _CoomState();
}

class _CoomState extends State<Coom> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18), // Adjust the font size as needed
          bodyMedium: TextStyle(fontSize: 16), // Adjust the font size as needed
          // Add more text styles as needed
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 189, 227, 244),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 189, 227, 244),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  // Add functionality for the Rewards button
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                child: const Row(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Community Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24, // Increased font size to 24
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pick Your Avatar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add functionality for selecting the first avatar
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/avatar1.png'),
                      radius: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add functionality for selecting the second avatar
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/avatar2.png'),
                      radius: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add functionality for selecting the third avatar
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/avatar3.png'),
                      radius: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Issue of Interest',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'Enter your issue of interest',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add functionality for the cancel button
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              minimumSize: const Size(140, 60),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.close),
                                  SizedBox(width: 5),
                                  Text('Cancel'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to the CommunityRules page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CommunityPageOne()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: const Size(140, 60),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 16.0),
                              child: Text(
                                'Ok',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const Coom());
}

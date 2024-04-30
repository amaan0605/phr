import 'package:flutter/material.dart';
import 'package:phr_app/pages/Navbar/coom.dart';
// import 'package:phr_app/pages/Navbar/view_community_profile.dart'; // Import the required page

class Communityrules extends StatefulWidget {
  const Communityrules({Key? key}) : super(key: key);

  @override
  State<Communityrules> createState() => _CommunityrulesState();
}

class _CommunityrulesState extends State<Communityrules> {
  bool agreedToRules = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
              height:
                  30), // Increased space between app bar and community rules
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Community Rules',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87, // Adjust the color here
              ),
            ),
          ),
          const SizedBox(height: 20), // Increased additional space
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.9, // Increased width
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '1. If you are suicidal, please call help.',
                  style: TextStyle(fontSize: 18), // Increase the font size here
                ),
                const Text(
                  '2. Do not post inappropriate content.',
                  style: TextStyle(fontSize: 18), // Increase the font size here
                ),
                const Text(
                  '3. This is a moderated channel.',
                  style: TextStyle(fontSize: 18), // Increase the font size here
                ),
                const Text(
                  '4. Do not reveal identity.',
                  style: TextStyle(fontSize: 18), // Increase the font size here
                ),
                const Text(
                  '5. Be Supportive.',
                  style: TextStyle(fontSize: 18), // Increase the font size here
                ),
                const Text(
                  '6. This is not professional guidance.',
                  style: TextStyle(fontSize: 18), // Increase the font size here
                ),
                const SizedBox(height: 10), // Leave one line space
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          agreedToRules = !agreedToRules;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color:
                              agreedToRules ? Colors.green : Colors.transparent,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: agreedToRules
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 18)
                            : null,
                      ),
                    ),
                    const SizedBox(width: 8), // Add space between box and text
                    const Text(
                      'I agree to the Community rules',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Add space between button and text
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Coom()), // Navigate to Communityprofile page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('CREATE COMMUNITY PROFILE'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

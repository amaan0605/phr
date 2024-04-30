import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/loginabha.dart';
import 'package:phr_app/pages/ABHA/loginemail.dart';
import 'package:phr_app/pages/ABHA/loginmobile.dart';
import 'package:phr_app/pages/ABHA/Registration/abha_page_one.dart'; // Import statement added
import 'package:shared_preferences/shared_preferences.dart';

class Loginone extends StatefulWidget {
  const Loginone({Key? key}) : super(key: key);

  @override
  State<Loginone> createState() => _LoginoneState();
}

class _LoginoneState extends State<Loginone> {
  List<String> name = [
    'Mobile Number',
    'Email ID',
    'ABHA Address',
  ];

  String? selectedOption;

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 227, 244),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 227, 244),
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
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                'Login',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'I want to Login via\n',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Column(
                children: name.map((option) {
                  return RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                        if (value != null) {
                          addList(value);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const Spacer(), // Use Spacer to take all available space
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 45,
                    width: 330,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle continue button click
                        if (selectedOption == 'Mobile Number') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginMobile(),
                            ),
                          );
                        } else if (selectedOption == 'Email ID') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginEmail(),
                            ),
                          );
                        } else if (selectedOption == 'ABHA Address') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginABHA(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Abhapageone
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Abhapageone(),
                        ),
                      );
                    },
                    child: const Text('Register'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addList(String s) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("editList", [s]);
  }

  Future<List<String>> getList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp = prefs.getStringList("editList")?.toList() ?? [];
    if (temp.isNotEmpty) {
      setState(() {
        selectedOption = temp.first;
      });
    }
    return temp;
  }
}

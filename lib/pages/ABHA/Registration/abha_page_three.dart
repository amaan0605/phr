import 'package:flutter/material.dart';
import 'package:phr_app/pages/ABHA/Registration/abha_page_four.dart';

class Abhapagethree extends StatefulWidget {
  const Abhapagethree({super.key});

  @override
  State<Abhapagethree> createState() => _AbhapagethreeState();
}

class _AbhapagethreeState extends State<Abhapagethree> {
  List<TextEditingController> mobileNumberControllers =
      List.generate(6, (index) => TextEditingController());
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nRegister with ABHA Number',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\nEnter OTP send on registered mobile number',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: List.generate(
                    6,
                    (index) => Container(
                      height: 50,
                      width: 45,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextField(
                        controller: mobileNumberControllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: 355,
          child: ElevatedButton(
            onPressed: () {
              // Handle Continue button click
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Abhapagefour()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Text('Continue'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in mobileNumberControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class CreateAbha extends StatelessWidget {
  const CreateAbha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create ABHA Number'),
      ),
      body: const Center(
        child: Text('This is the CreateAbha page.'),
      ),
    );
  }
}

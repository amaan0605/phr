import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phr_app/services/firebase_database_docs.dart';

//This page contain some basic widget and textformfield to get input.
// This page is used to update user credentials  by calling functions updateusername,updateuseremail,updateusermobile in class FirebaseDatabaseDocs
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Edit your Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty || !RegExp('[a-zA-Z]').hasMatch(value)) {
                    return "Enter valid name";
                  } else {
                    return null;
                  }
                },
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.perm_identity_sharp),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Name',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Email",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                validator: (value) {
                  print(value);
                  if (value!.isEmpty ||
                      !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Enter valid Email";
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.email_outlined),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'abc@gmail.com',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Mobile",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter valid mobile";
                  } else {
                    return null;
                  }
                },
                controller: mobile,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.perm_identity_sharp),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'mobile',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey)),
                  onPressed: () async {
                    bool abcd = false;
                    if (mobile.text.isNotEmpty) {
                      if (mobile.text.length == 10) {
                        await FirebaseDatabaseDocs.updateusermobile(
                            mobile.text);
                        abcd = true;
                      } else {
                        const scnakbar = SnackBar(
                          content: Text('length of mobile no should be 10'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                      }
                    }

                    if (emailController.text.isNotEmpty) {
                      await FirebaseDatabaseDocs.updateuseremail(
                          emailController.text);
                      abcd = true;
                    }
                    if (nameController.text.isNotEmpty) {
                      await FirebaseDatabaseDocs.updateusername(
                          nameController.text);
                      abcd = true;
                    }

                    mobile.clear();
                    emailController.clear();

                    nameController.clear();

                    if (abcd) {
                      const scnakbar = SnackBar(
                        content: Text('Details updated'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                    } else {
                      const scnakbar = SnackBar(
                        content: Text('Fill the detail you want to update'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                    }
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

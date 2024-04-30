import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phr_app/pages/OCR/scan_info.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:phr_app/pages/OCR/api.dart';

// It is used to upload the docunment and implement OCR.
// TODO: OCR is not complete you can see getOCR function in which API is called using post call .
// TODO: in this the string we are sending using base64 is not same as in android so the api is not giving the same answer

//In this class you find a function _showDialogphoto which is used to get image it show a dialog box which ask about the image (camera ,galery)
//then the finction get the image according and then navigate to other page where the image is shown.
class ScanFilePage extends StatefulWidget {
  const ScanFilePage({Key? key}) : super(key: key);

  @override
  State<ScanFilePage> createState() => _ScanFilePageState();
}

class ErrorMessage extends StatelessWidget {
  final String message;
  final bool show;
  const ErrorMessage({Key? key, String? message, bool? show})
      : message = message ?? "Something went wrong",
        show = show ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ScanFilePageState extends State<ScanFilePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File _profilePicture = File("");

  TextEditingController dateController = TextEditingController();

  String? choosenDocunment;
  List<String> docunmentType = [
    "Lab Prescription",
    "Lab Reports",
    "Insurance Documents",
    "Doctor Reports",
  ];

  late String patientname;
  late String doctorname;
  late String description;
  late String category;
  late String date;

  Future<void> getOCR(String base64image) async {
    print("Ocr request initiate ${base64image.length}");
    final response = await http.post(
      Uri.parse("$OCR_ENDPOINT/ocr"),
      headers: <String, String>{
        'Content-Type':
            'application/json', // 'connection': 'keep-alive', ; charset=UTF-8
      },
      body: jsonEncode(<String, String>{'image': base64image}),
    );
    print("After Ocr request");
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Sstatus: ${response.statusCode} ${response.body}');
      throw Exception('Failed to get OCR');
    }
  }

  Future<Uint8List> testComporessList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 100,
      // rotate: 135,
    );
    print(list.length);
    print(result.length);
    return result;
  }

  Future<Uint8List> testCompressFile(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.path,
      minWidth: 1920,
      minHeight: 1080,
      quality: 100,
      format: CompressFormat.jpeg,
      // rotate: 90,
    );
    print(file.lengthSync());
    print(result?.length);
    // Uint8List abc= await testComporessList(result!);
    return result!;
  }

  Future<String> convertTobase64(File image) async {
    // Image imag =Image.file(image);
    Uint8List imagebytes = await testCompressFile(image);
    // Uint8List imagebytes = await image.readAsBytesSync();
    // convert to bytes
    // Uint8List imagebytes=imag.image.
    // imagebytes =await testComporessList(imagebytes);
    print(imagebytes.length);
    String base64string = base64.encode(imagebytes);
    print(base64string[77]);
    return base64string;
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: 1));
  }

  Future<void> _showDialogphoto(
    BuildContext context,
  ) async {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var topInsets = MediaQuery.of(context).viewInsets.top;
    var bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    // ignore: unused_local_variable
    var useableHeight = screenHeight - topInsets - bottomInsets;
    String str1 = "Photo Gallery";

    return showDialog(
      context: _scaffoldKey.currentContext!,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(220, 229, 228, 1),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenWidth * 0.025,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.075,
                vertical: screenWidth * 0.05,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final imageFile = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                        maxHeight: 650,
                        maxWidth: 650,
                      );

                      if (imageFile == null) {
                        return;
                      }

                      setState(() {
                        print("gallery image ${imageFile.path}");
                        _profilePicture = File(imageFile.path);
                      });
                      // int timestamp = DateTime.now().millisecondsSinceEpoch;
                      // final filepath = 'uid$timestamp';

                      try {
                        String base64image =
                            await convertTobase64(_profilePicture);
                        await getOCR(base64image);

                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OCRInfo(
                                storedImage: _profilePicture,
                                choosenDocunment: choosenDocunment!,
                                date: dateController.text,
                                image: _profilePicture,
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                        const scnakbar = SnackBar(
                          content: Text(
                              'An error occured while uploading the image'),
                        );
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                          Navigator.pop(context);
                        }
                      }

                      // setState(() => choosenDocunment = null);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(220, 229, 228, 1),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.075,
                        vertical: screenWidth * 0.05,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          str1,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff007AFF)),
                        ),
                      ),
                    ),
                  ),
                  /*
                  const Divider(
                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final imageFile = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 80,
                        maxHeight: 650,
                        maxWidth: 650,
                      );

                      if (imageFile == null) return;

                      setState(() {
                        _profilePicture = File(imageFile.path);
                      });

                      print("camera");

                      String base64image =
                          await convertTobase64(_profilePicture);
                      await getOCR(base64image);

                      print("Ocr request");

                      if (mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OCRInfo(
                              storedImage: _profilePicture,
                              choosenDocunment: choosenDocunment!,
                              date: dateController.text,
                              image: _profilePicture,
                            ),
                          ),
                        );
                      }

                      // Navigator.pop(context);
                      // setState(() {
                      //   choosenDocunment=null;
                      // });
                      // _saveUploadedImage(context, imageNetworkUrl);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(220, 229, 228, 1),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.075,
                        vertical: screenWidth * 0.05,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          str2,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff007AFF)),
                        ),
                      ),
                    ),
                  ),
                  */
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(220, 229, 228, 1),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenWidth * 0.025,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.075,
                      vertical: screenWidth * 0.05,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff007AFF)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          title: Text("Upload Image",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 0.02 * height)),
          centerTitle: true,
          backgroundColor: const Color(0xffF5F5F5),
          elevation: 5.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            tooltip: 'Back Icon',
            onPressed: () {},
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 0.04 * height, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose the options",
                style: TextStyle(
                    color: const Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 0.02 * height),
              ),
              SizedBox(
                height: 0.04 * height,
              ),
              DropdownButtonFormField(
                autofocus: false,

                decoration: InputDecoration(
                  focusedBorder: _buildBorder(const Color(0xff42CCC3)),
                  border: _buildBorder(const Color(0xffEBEBEB)),
                  // label: const Text(
                  //   "Select",
                  //   style: TextStyle(color: Color(0xff42CCC3)),
                  // ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                focusColor: Colors.white,
                value: choosenDocunment,
                //elevation: 5,
                style: const TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items:
                    docunmentType.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    choosenDocunment = value;
                  });
                },
                hint: const Text(
                  "Select Documents",
                  style: TextStyle(color: Color(0xff6C757D), fontSize: 15),
                ),
              ),
              SizedBox(
                height: 0.04 * height,
              ),
              TextField(
                controller:
                    dateController, //editing controller of this TextField
                decoration: InputDecoration(
                    focusedBorder: _buildBorder(const Color(0xff42CCC3)),
                    border: _buildBorder(const Color(0xffEBEBEB)),
                    icon: const Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true, // when true user cannot edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                    String formattedDate = DateFormat('MMM d, yyyy').format(
                        pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    print(
                        formattedDate); //formatted date output using intl package =>  2022-07-04
                    //You can format date as per your need

                    setState(() {
                      dateController.text =
                          formattedDate; //set foratted date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              SizedBox(
                height: 0.06 * height,
              ),
              Container(
                margin: const EdgeInsets.only(left: 50, right: 50),
                height: 0.07 * height,
                child: TextButton(
                  onPressed: () {
                    if (dateController.text.isNotEmpty &&
                        choosenDocunment != null) {
                      _showDialogphoto(context);
                    } else {
                      const scnakbar = SnackBar(
                        content: Text('Select the Date and Docunment'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff004494),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xff004494),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Upload Image',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 0.025 * height,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

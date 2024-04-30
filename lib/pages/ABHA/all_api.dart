import 'dart:convert';

import 'package:http/http.dart' as http;

class ABHAAPIs {
  dynamic user = {};

  //{"data":"{\"healthIdNumber\":\"91-7332-6004-7366\",
  // \"healthId\":null,
  // \"mobile\":\"7206117880\",
  // \"firstName\":\"Harsh\",
  //
  // \"lastName\":\"\",
  // \"name\":\"Harsh\",
  // \"yearOfBirth\":\"2003\",
  // \"dayOfBirth\":\"16\",
  // \"monthOfBirth\":\"11\",
  // \"gender\":\"M\",
  // \"email\":null,\
  // "profilePhoto\":\"/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCADIAKADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHi

  // It returns a
  static gethealthidOTP(String healthid) async {
    print('inside');
    final response = await http.post(
      Uri.parse("http://192.168.41.111:3000/login/aadhaar/authinit"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        // 'connection': 'keep-alive', ; charset=UTF-8
      },
      body: jsonEncode(
          <String, String>{"authMethod": "AADHAAR_OTP", "healthid": healthid}),
    );

    print(response.body);
    try {
      dynamic dca = jsonDecode(response.body)['txnId'];
      return dca;
    } catch (e) {
      return null;
    }
  }

  static checkHealthIdOTP(String otp, String txid) async {
    print('inside');
    print(otp);
    print(txid);
    final response = await http.post(
      Uri.parse(
          "http://192.168.41.111:3000/login/aadhaar/confirm-with-aadhaar-otp"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{"otp": otp, "txnid": txid}),
    );

    dynamic abc = jsonDecode(response.body);
    if (abc['data'] == null) return null;
    abc = jsonDecode(abc['data']);
    return abc['token'];
  }

  static getprofile(String xToken) async {
    final response = await http.post(
      Uri.parse("http://192.168.41.111:3000/getProfile"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{'X_Token': xToken}),
    );

    print(response.body);
    dynamic abc = jsonDecode(response.body);
    dynamic ac = jsonDecode(abc['data']);
    print(ac);
    Map<String, String> map = {
      "dayOfBirth": ac['dayOfBirth'],
      "firstName": ac['firstName'],
      "gender": ac['gender'],
      "lastName": ac['lastName'],
      "middleName": ac['middleName'],
      "monthOfBirth": ac['monthOfBirth'],
      "name": ac['firstName'] + " " + ac['middleName'] + " " + ac['lastName'],
      "yearOfBirth": ac['yearOfBirth'],
      "profilePhoto": ac['profilePhoto'],
      "mobile": ac['mobile'],
      "healthIdNumber": ac["healthIdNumber"]
    };
    return map;
  }
}

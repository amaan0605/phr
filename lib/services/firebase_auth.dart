import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthen {
  final FirebaseAuth _auth;
  FirebaseAuthen(this._auth);

  //This function is used to sign up in firebase using createUserWithEmailAndPassword function of firebase
  Future<void> singupwithemail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print(email);
      print(password);

      print("I am inside "
          ""
          ""
          "");

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      print(credential);
      print(credential);
      print(credential);
      print(credential);

      // UserCredential(
      // additionalUserInfo: AdditionalUserInfo(
      // isNewUser: false, profile: {},
      // providerId: null, username: null),
      // credential: null,
      // user: User(displayName: null, email: harshyd003@gmail.com, emailVerified: false, isAnonymous: false, metadata: UserMetadata(creationTime: 2023-04-04 10:31:15.256Z, lastSignInTime: 2023-04-06 19:03:04.514Z), phoneNumber: null, photoURL: null, providerData, [UserInfo(displayName: null, email: harshyd003@gmail.com, phoneNumber: null, photoURL: null, providerId: password, uid: harshyd003@gmail.com)], refreshToken: , tenantId: null, uid: nK9rpDOLeEfLEwdYkdJCX3DSpeM2))
      print("I am inside "
          ""
          ""
          "");

      // await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      print("hjvwcdhvfhvrlhhvfrlfvrejvuervhj"
          "fberagberkjbvrj;bgv;iuerbgojrjbvrj"
          "jnvjevbvjbvrjerbvjoergber;jbkjetv"
          "jkvbkerjbij;btvbervb");
      print(e.message!);
      print("  ");
      print("  ");
      print("  ");
      print("  ");
      showsnackBar(context, e.message!);
    }
  }

  //This function is used to login up in firebase using signInWithEmailAndPassword function of firebase
  Future<void> loginwithemail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print("I am inside "
          ""
          ""
          "");
      final credential = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      print(credential);
      print(credential);
      print(credential);
      print(credential);
      // if(!_auth.currentUser!.emailVerified){
      //   await sendEmailVerification(context);
      // }

      print("I am inside "
          ""
          ""
          "");
      print("singind");
    } on FirebaseAuthException catch (e) {
      showsnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showsnackBar(context, 'Email verification send');
    } on FirebaseAuthException catch (e) {
      showsnackBar(context, e.message!);
    }
  }
}

void showsnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}

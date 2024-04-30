import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseStorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  // this function upload the photo to the backend and get the link of the photo
  Future<String> uploadImage(String path, File file) async {
    try {
      TaskSnapshot link = await storage.ref('images/$path').putFile(file);
      final url = link.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      print(e);
      return "";
    }
  }
}

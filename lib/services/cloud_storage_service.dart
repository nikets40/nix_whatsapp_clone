import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageService {

  static CloudStorageService instance = CloudStorageService();

  FirebaseStorage _storage;
  StorageReference _baseRef;
  String profileImages = "profile_images";

  CloudStorageService() {
    _storage = FirebaseStorage.instance;
    _baseRef = _storage.ref();
  }

   uploadUserImage(File _image) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    try {
        await _baseRef
            .child(profileImages)
            .child(user.uid)
            .putFile(_image)
            .onComplete;

        var imageUrl = await _baseRef.child(profileImages).child(user.uid).getDownloadURL();

//        print(imageUrl);
        return imageUrl.toString();
    }
    catch (e) {
      print(e);
      return null;
    }
  }
}
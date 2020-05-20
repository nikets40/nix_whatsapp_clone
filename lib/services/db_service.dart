import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBService {
  static DBService instance = DBService();

  Firestore _db;

  DBService() {
    _db = Firestore.instance;
  }

  String _userCollections = "Users";

  Future<void> createUserInDB(String _number, String _uid) async{

    try{
      return
        await _db.collection(_userCollections).document(_uid).setData({
          "number": _number,
          "lastSeen": DateTime.now(),
        });
    }
    catch(e){
      print(e);
    }

  }

  Future<void> addProfileInfoInDB(String _name, String profilePicture) async{

    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    try{
      return
        await _db.collection(_userCollections).document(user.uid).updateData({
        "name": _name,
          "profilePicture": profilePicture,
        });
    }
    catch(e){
      print(e);
    }

  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {

    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData(
  {required Uint8List file}
      )
  async {
    String resp = "some errors occured";
    try{
     String imageUrl = await uploadImageToStorage('ProfileImage', file);
     await _firestore.collection('users').add({
       'imageLink': imageUrl,
     });
     resp = "success";
    }
        catch(err)
        {
          resp = err.toString();
        }
        return resp;
  }

}
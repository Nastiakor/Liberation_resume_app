import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    print('test photo ${downloadUrl}');
    return downloadUrl;
  }

  Future<String> saveData({required Uint8List file}) async {
    String resp = "some errors occurred";
    try {
      String imageUrl = await uploadImageToStorage('ProfileImage', file);
      resp = "success";
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}

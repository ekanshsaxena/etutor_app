import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UpdateStudent {
  final String uid;
  UpdateStudent({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateStudentDetails(File img, String name, int phone, int age,
      String address, String gender, String standard, String subjects) async {
    String fileName = uid;
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(img);
    // ignore: unused_local_variable
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    if (taskSnapshot.error != null) {
      return null;
    }
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    //print(downloadUrl);
    try {
      return await userCollection.document(uid).setData({
        'name': name,
        'occupation': "student",
        'phone': phone,
        'age': age,
        'address': address,
        'gender': gender,
        'standard': standard,
        'subjects': subjects,
        'flag': 1,
        'img': {"url": downloadUrl, "name": uid},
      });
      //print("done");
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UpdateTutor {
  final String uid;
  UpdateTutor({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateTutorDetails(
      File img,
      String name,
      int phone,
      int age,
      String address,
      String gender,
      String subjects,
      int fees,
      String acad,
      String experience) async {
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
    try {
      await userCollection.document(uid).setData({
        'name': name,
        'occupation': "teacher",
        'phone': phone,
        'age': age,
        'address': address,
        'gender': gender,
        'acad': acad,
        'subjects': subjects,
        'experience': experience,
        'flag': 1,
        'city': "gorakhpur",
        'fees': fees,
        'img': {"url": downloadUrl, "name": uid},
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
    return true;
  }
}

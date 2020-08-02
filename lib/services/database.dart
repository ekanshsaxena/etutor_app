import 'package:etutor/models/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection Reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String name, String occupation, String city) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'occupation': occupation,
      'city': city,
      'flag': 0,
      'fav': [],
      'req': [],
      'admin_approval': 0,
    });
  }

//user list from snapshot
  List<userData> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents
        .where((element) => element.data['occupation'] == 'teacher')
        .map((doc) {
      return userData(
          doc: doc,
          uid: doc.documentID,
          imgarr: doc.data['img'] ?? '',
          name: doc.data['name'] ?? '',
          occupation: doc.data['occupation'] ?? '',
          city: doc.data['city'] ?? '',
          fees: doc.data['fees'] ?? '',
          subjects: doc.data['subjects'] ?? '');
    }).toList();
  }

//get users stream
  Stream<List<userData>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}

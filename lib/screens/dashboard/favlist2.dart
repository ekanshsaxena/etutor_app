import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etutor/screens/home/info_holder.dart';
import 'package:etutor/shared/loading.dart';
import 'package:flutter/material.dart';

//import 'package:provider/provider.dart';
final CollectionReference userCollection =
    Firestore.instance.collection('users');
List<InfoHolder> arr = [];
Future<bool> test(doc) async {
  if (!arr.isEmpty) {
    arr = [];
  }
  await doc.get().then((val) async {
    if (val.data['fav'] != null) {
      for (var uidd in val.data['fav']) {
        await userCollection.document(uidd).get().then((value) {
          arr.add(InfoHolder(
            userCollection.document(uidd),
            value.data['img'],
            value.data['name'],
            value.data['city'],
            value.data['fees'],
            value.data['subjects'],
          ));
        });
      }
    }
  });
  return true;
}

class FavList extends StatefulWidget {
  var doc;
  FavList({this.doc});
  @override
  _FavListState createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: test(widget.doc),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          //print(arr);
          return Scaffold(
              backgroundColor: Colors.blue[50],
              appBar: AppBar(
                title: Text("My Saved"),
              ),
              body: ListView.builder(
                itemCount: arr.length,
                itemBuilder: (context, index) {
                  return arr[index];
                },
              ));
        } else {
          return Loading();
        }
      },
    );
  }
}

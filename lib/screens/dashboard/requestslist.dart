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
    if (val.data['req'] != null) {
      for (var uidd in val.data['req']) {
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

class ReqList extends StatefulWidget {
  var doc;
  ReqList({this.doc});
  @override
  _ReqListState createState() => _ReqListState();
}

class _ReqListState extends State<ReqList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: test(widget.doc),
      builder: (context, snapshot) {
        if (snapshot != null) {
          //print(arr);
          return Scaffold(
              backgroundColor: Colors.blue[50],
              appBar: AppBar(
                title: Text("My Requests"),
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

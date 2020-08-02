import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:etutor/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:etutor/models/user.dart';
import 'package:etutor/screens/dashboard/dashboard.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print(user);
    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      var doc = Firestore.instance.collection('users').document(user.uid);
      //return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Dashboard(doc: doc);
      //}));
    }
  }
}

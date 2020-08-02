import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etutor/models/user_data.dart';
import 'package:etutor/screens/home/info_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class userList extends StatefulWidget {
  @override
  _userListState createState() => _userListState();
}

class _userListState extends State<userList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<userData>>(context) ?? [];
    if (users != null) {
      return Scaffold(
          body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return InfoHolder(
            Firestore.instance.collection('users').document(users[index].uid),
            users[index].imgarr,
            users[index].name,
            users[index].city,
            users[index].fees,
            users[index].subjects,
          );
        },
      ));
    } else {
      return Container(
        child: Text('No teacher found'),
      );
    }
  }
}

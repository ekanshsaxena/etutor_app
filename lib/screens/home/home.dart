import 'package:etutor/models/user_data.dart';
import 'package:etutor/services/auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etutor/services/database.dart';
import 'package:etutor/screens/home/userlist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_field
  final AuthService _auth = AuthService();
  //Widget _appBarTitle = new Text('Search...');
  //Icon _searchIcon = new Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    // void _searchPressed() {
    //   setState(() {
    //     if (this._searchIcon.icon == Icons.search) {
    //       this._searchIcon = new Icon(Icons.close);
    //       this._appBarTitle = new TextField(
    //         decoration: new InputDecoration(
    //             hoverColor: Colors.white,
    //             focusColor: Colors.white,
    //             prefixIcon: new Icon(Icons.search),
    //             hintText: 'Search...'),
    //       );
    //     } else {
    //       _searchIcon = Icon(Icons.search);
    //       this._appBarTitle = new Text('Search Results');
    //     }
    //   });
    // }

    Widget _buildBar(BuildContext context) {
      return new AppBar(
        centerTitle: true,
        title: Text("Find Tutor"),
        /* actions: <Widget>[
            new IconButton(
              icon: _searchIcon,
              onPressed: _searchPressed,
            ),
          ] */
      );
    }

    return StreamProvider<List<userData>>.value(
      value: DatabaseService().users,
      child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: _buildBar(context),
          body: userList()),
    );
  }
}

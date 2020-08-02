import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etutor/models/user.dart';
import 'package:etutor/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

String _name = '';
String _exp = '';
int _fees = 0;
String _img = " ";
Map _arr = {};
int _rating = 5;
String _gender = '';
int _age = 0;
String _acad = '';
String _subjects = '';
Icon _favIcon = new Icon(Icons.favorite_border);
Color _buttonColor = Colors.blue[200];
String _buttontext = 'Submit info request';
Future<bool> testFut(doc, userdoc) async {
  //print(_favIcon);
  await doc.get().then((value) {
    _arr = value.data['img'];
    if (_arr != null) {
      _img = _arr['url'];
    }
    _name = value.data['name'];
    _exp = value.data['experience'];
    _fees = value.data['fees'];
    _gender = value.data['gender'];
    _age = value.data['age'];
    _acad = value.data['acad'];
    _subjects = value.data['subjects'];
  });
/*   _name = doc.data['name'];
  _exp = doc.data['experience'];
  _fees = doc.data['fees'];
  _gender = doc.data['gender'];
  _age = doc.data['age'];
  _acad = doc.data['acad'];
  _subjects = doc.data['subjects']; */
  await userdoc.get().then((mydoc) {
    if (mydoc.data['fav'] != null) {
      for (var uid in mydoc.data['fav']) {
        if (uid == doc.documentID) {
          //print(uid);
          _favIcon = new Icon(
            Icons.favorite,
            color: Colors.red,
          );
          break;
        } else {
          _favIcon = new Icon(Icons.favorite_border);
        }
      }
    }
    if (mydoc.data['req'] != null) {
      for (var uid in mydoc.data['req']) {
        if (uid == doc.documentID) {
          //print(uid);
          _buttonColor = Colors.white;
          _buttontext = 'Cancel info request';
          break;
        } else {
          _buttonColor = Colors.blue[200];
          _buttontext = 'Submit info request';
        }
      }
    }
  });
  if (_gender != null) {
    return true;
  } else {
    return testFut(doc, userdoc);
  }
}

class Profile extends StatefulWidget {
  var doc;
  Profile({this.doc});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    var userdoc = Firestore.instance.collection('users').document(user.uid);

    void _favPressed() {
      setState(() {
        if (_favIcon.icon == Icons.favorite_border) {
          _favIcon = new Icon(
            Icons.favorite,
            color: Colors.red,
          );
          Toast.show("Added to favourites", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          List<String> _fav = [widget.doc.documentID];
          userdoc.updateData({
            'fav': FieldValue.arrayUnion(_fav),
          });
        } else {
          _favIcon = Icon(Icons.favorite_border);
          Toast.show("Removed from favourites", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          List<String> _fav = [widget.doc.documentID];
          userdoc.updateData({
            'fav': FieldValue.arrayRemove(_fav),
          });
        }
      });
    }

    void _buttonPressed() {
      setState(() {
        if (_buttonColor == Colors.white) {
          _buttonColor = Colors.blue[200];
          _buttontext = "Submit info request";
          Toast.show("Info Request Cancelled", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          List<String> _req = [widget.doc.documentID];
          userdoc.updateData({
            'req': FieldValue.arrayRemove(_req),
          });
        } else {
          _buttonColor = Colors.white;
          _buttontext = "Cancel info request";
          Toast.show("Info request Submitted", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          List<String> _req = [widget.doc.documentID];
          userdoc.updateData({
            'req': FieldValue.arrayUnion(_req),
          });
        }
      });
    }

    Widget _buildBar(BuildContext context) {
      return new AppBar(
        centerTitle: true,
        title: Text("Profile"),
        actions: <Widget>[
          new IconButton(
            icon: _favIcon,
            onPressed: _favPressed,
          )
        ],
      );
    }

    //print(widget._name);
    return FutureBuilder(
        future: testFut(widget.doc, userdoc),
        builder: (context, snapshot) {
          if (snapshot.data != null && _gender != null) {
            return Scaffold(
              appBar: _buildBar(context),
              body: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.blue, Colors.transparent])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 5),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: CircleAvatar(
                                backgroundImage: (_img != null)
                                    ? NetworkImage(
                                        _img,
                                      )
                                    : Image.asset(
                                        "assets/images/unpic.png",
                                        fit: BoxFit.fill,
                                      ),
                                radius: 95,
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              _name,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 22.0,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.white,
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 22.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Fees/subject",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(_fees.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Color(0xffe6020a),
                                                  )),
                                              /* Image.asset(
                                                "assets/images/star.png",
                                                height: 23,
                                                width: 23,
                                              ) */
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Age",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _age.toString(),
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xffe6020a),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Gender",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _gender,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xffe6020a),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "◆ Master in Subjects :",
                            style: TextStyle(
                                decorationStyle: TextDecorationStyle.wavy,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "    " + _subjects,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /* Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "◆ Expected Salary :",
                            style: TextStyle(
                                decorationStyle: TextDecorationStyle.wavy,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "    ₹" + _fees.toString() + "/subject",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), */
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "◆ Academic Qualifications :",
                            style: TextStyle(
                                decorationStyle: TextDecorationStyle.wavy,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "     " + _acad,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "◆ Teaching Experience :",
                            style: TextStyle(
                                decorationStyle: TextDecorationStyle.wavy,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "     " + _exp,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 60, right: 60, bottom: 100),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffe6020a),
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Material(
                              color: _buttonColor,
                              borderRadius: BorderRadius.circular(30),
                              elevation: 14.0,
                              shadowColor: Color(0x802196F3),
                              child: InkWell(
                                  onTap: () {
                                    _buttonPressed();
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: Center(
                                    child: Text(
                                      _buttontext,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xffe6020a),
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  )))))
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

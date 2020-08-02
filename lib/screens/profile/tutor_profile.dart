import 'package:etutor/screens/profile/tutor_form.dart';
import 'package:etutor/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _name = '';
String _exp = '';
int _fees = 0;
int _phone = 0;
String _img = '';
Map arr = {};
int _rating = 5;
String _gender = '';
int _age = 0;
String _acad = '';
String _address = '';
String _subjects = '';
Future<bool> testFut(doc) async {
  _img = '';
  arr = {};
  await doc.get().then((doc) {
    //print(doc);
    _name = doc.data['name'];
    arr = doc.data['img'];
    if (arr != null) {
      _img = arr['url'];
      print(_img);
    }
    _exp = doc.data['experience'];
    _fees = doc.data['fees'];
    _gender = doc.data['gender'];
    _age = doc.data['age'];
    _phone = doc.data['phone'];
    _acad = doc.data['acad'];
    _address = doc.data['address'];
    _subjects = doc.data['subjects'];
  });
  if (_gender != null) {
    return true;
  } else {
    return testFut(doc);
  }
}

class TutorProfile extends StatefulWidget {
  var doc;
  TutorProfile({this.doc});
  @override
  _TutorProfileState createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: testFut(widget.doc),
        builder: (context, snapshot) {
          if (snapshot.data != null && _gender != null) {
            return Scaffold(
              //backgroundColor: Colors.blue[50],
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text("My Profile"),
              ),
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
                            padding: const EdgeInsets.only(top: 15),
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
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "◆ Contact Details :",
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
                            "     " + _address,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              letterSpacing: 2.0,
                            ),
                          ),
                          Text(
                            "     " + _phone.toString(),
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
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                              elevation: 14.0,
                              shadowColor: Color(0x802196F3),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return TutorForm(doc: widget.doc);
                                    }));
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: Center(
                                    child: Text(
                                      "Edit Profile",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
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

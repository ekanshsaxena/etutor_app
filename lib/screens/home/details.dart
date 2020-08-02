import 'package:flutter/material.dart';
import 'package:etutor/screens/home/Profile.dart';

class MyDetailsContainer extends StatelessWidget {
  String _name;
  String _city;
  String _subjects;
  int _fees;
  var doc;

  MyDetailsContainer(
      this.doc, this._name, this._city, this._fees, this._subjects);

  @override
  Widget build(BuildContext context) {
    return Container(
//      child: Material(
//        child: InkWell(
//          onTap: () {
//            Navigator.push(context, MaterialPageRoute(builder: (context) {
//              //print(doc);
//              return Profile(doc: doc);
//            }));
//          },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                  child: Text(
                _name,
                style: TextStyle(
                    color: Color(0xffe6020a),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Text(
                    "Subjects: ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )),
                  Container(
                      child: Text(
                    _subjects,
                    style: TextStyle(color: Colors.black54, fontSize: 18.0),
                  )),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Text(
                    "City: ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )),
                  Container(
                      child: Text(
                    _city,
                    style: TextStyle(color: Colors.black54, fontSize: 18.0),
                  )),
                ],
              )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                      Container(
                          child: Text(
                        "Fees: ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                          child: Text(
                        "₹ $_fees",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      )),
                      Container(
                          child: Text(
                        "/month",
                        style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      )),
                    ])))
          ]),
    );
  }
}

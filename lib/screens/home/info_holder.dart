import 'package:flutter/material.dart';
import 'package:etutor/screens/home/details.dart';
import 'package:etutor/screens/home/Profile.dart';

// ignore: must_be_immutable
class InfoHolder extends StatelessWidget {
  String _name;
  String _city;
  String _subjects;
  int _fees;
  Map _imgarr;
  var doc;

  InfoHolder(this.doc, this._imgarr, this._name, this._city, this._fees,
      this._subjects);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            //print(doc);
                            return Profile(doc: doc);
                          }));
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: MyDetailsContainer(
                                      doc, _name, _city, _fees, _subjects),
                                ),
                              ),
                              Container(
                                  width: 200,
                                  height: 200,
                                  child: ClipRRect(
                                      borderRadius:
                                          new BorderRadius.circular(24.0),
                                      child: Image.network(
                                        _imgarr['url'],
                                        fit: BoxFit.contain,
                                        alignment: Alignment.topRight,
                                      )))
                            ]))))));
  }
}

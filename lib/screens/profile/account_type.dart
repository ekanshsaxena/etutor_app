import 'package:etutor/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:etutor/screens/dashboard/dashboard_buttons.dart';

// ignore: must_be_immutable
class AccountType extends StatelessWidget {
  var doc;
  AccountType({this.doc});
  @override
  Widget build(BuildContext context) {
    int _admin = 0;
    String _occupation = '';
    Future admin() async {
      await doc.get().then((value) {
        _admin = value.data['admin_approval'];
        _occupation = value.data['occupation'];
      });
      return true;
    }

    return FutureBuilder(
      future: admin(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Scaffold(
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              elevation: 0.0,
              title: Text('Account Type'),
              backgroundColor: Colors.blue,
            ),
            body: new ListView(
              //shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      child: DashboardButton("Student",
                          "assets/images/student1.png", doc, 0, _occupation, 0),
                      height: 200.0,
                      width: 200.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    SizedBox(
                      child: DashboardButton(
                          "Teacher",
                          "assets/images/teacher1.png",
                          doc,
                          _admin,
                          _occupation,
                          0),
                      height: 200.0,
                      width: 200.0,
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}

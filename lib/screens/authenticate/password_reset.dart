import 'package:etutor/screens/authenticate/sign_in.dart';
//import 'package:etutor/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatelessWidget {
/*   var doc;
  PasswordReset({this.doc}); */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Password Change"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
              child: Text(
                "Please Change your password to continue!!!",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                " 1) Open your email account. \n\n 2) Open the email that comes from etutor. \n\n 3) Click on link mentioned in the mail. \n\n 4) That's it you will be able to change your password  :) ",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
              child: Text(
                "After Changing the password, \nPress on the below button to go to the sign in screen.",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.brown,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.fromLTRB(40.0, 0.0, 60.0, 0.0),
                child: RaisedButton(
                    color: Colors.blue[200],
                    child: Text("Sign in",
                        style: TextStyle(
                          color: Colors.black87,
                        )),
                    onPressed: () {
                      return Navigator.pop(context);
                    })),
          ),
        ],
      ),
    );
  }
}

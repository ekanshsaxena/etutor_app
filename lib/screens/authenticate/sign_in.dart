import 'package:etutor/screens/authenticate/password_reset.dart';
import 'package:etutor/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:etutor/services/auth.dart';
import 'package:etutor/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/back1.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter),
                ),
                child: Center(
                    child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 50.0,
                        right: 50.0,
                        top: 1.0,
                      ),
                      child: Image.asset(
                        "assets/images/welcome111.png",
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 50.0),
                      child: Image.asset(
                        "assets/images/auth_user.png",
                        height: 150.0,
                        width: 150.0,
                        color: Colors.white,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 50.0),
                        child: Form(
                          key: _formKey,
                          child: new ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              SizedBox(height: 10.0),
                              TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Email',
                                      icon: new Icon(
                                        Icons.mail,
                                        color: Colors.grey,
                                      )),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter an email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  }),
                              SizedBox(height: 20.0),
                              TextFormField(
                                  obscureText: true,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Password',
                                      icon: new Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      )),
                                  validator: (val) => val.length < 6
                                      ? 'Password must be greater then 6 char'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  }),
                              SizedBox(height: 40.0),
                              RaisedButton(
                                elevation: 5.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                color: Colors.pinkAccent,
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);
                                    //print(result);
                                    if (result == null) {
                                      setState(() {
                                        error = 'Credentials Incorrect';
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                              ),
                              SizedBox(height: 12.0),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                        width: 100,
                                        child: RaisedButton(
                                          elevation: 5.0,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0)),
                                          color: Colors.pinkAccent,
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.0),
                                          ),
                                          onPressed: () {
                                            widget.toggleView();
                                          },
                                        )),
                                    SizedBox(
                                        width: 100,
                                        child: RaisedButton(
                                          elevation: 5.0,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0)),
                                          color: Colors.pinkAccent,
                                          child: Text(
                                            'Forgot\nPassword?',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.0),
                                          ),
                                          onPressed: () async {
                                            if (email != null) {
                                              setState(() {
                                                loading = true;
                                              });
                                              dynamic result = await _auth
                                                  .resetPassword(email);
                                              if (result == null) {
                                                error = 'Credentials Incorrect';
                                                loading = false;
                                              } else {
                                                setState(() {
                                                  loading = false;
                                                });
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return PasswordReset();
                                                }));
                                              }
                                            }
                                          },
                                        )),
                                  ]),
                              SizedBox(height: 12.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        )),
                  ],
                ))));
  }
}

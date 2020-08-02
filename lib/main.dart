import 'package:etutor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:etutor/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:etutor/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
        ),
      ),
    );
  }
}

import 'package:etutor/screens/dashboard/faq.dart';
import 'package:etutor/screens/dashboard/favlist2.dart';
import 'package:etutor/screens/dashboard/privacy_policies.dart';
import 'package:etutor/screens/dashboard/requestslist.dart';
import 'package:etutor/screens/profile/account_type.dart';
import 'package:etutor/screens/profile/admin_approval.dart';
import 'package:etutor/screens/profile/student_form.dart';
import 'package:etutor/screens/profile/student_profile.dart';
import 'package:etutor/screens/profile/tutor_form.dart';
import 'package:etutor/screens/profile/tutor_profile.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:etutor/screens/home/home.dart';

// ignore: must_be_immutable
class DashboardButton extends StatelessWidget {
  String _name;
  String _img;
  var doc;
  int _adminApproval;
  String _occupation;
  int _flag;
  DashboardButton(this._name, this._img, this.doc, this._adminApproval,
      this._occupation, this._flag);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
            //color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: InkWell(
                onTap: () {
                  Toast.show(_name + " Tapped", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  // ignore: missing_return
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (_name == "Search") {
                      return Home();
                    } else if (_name == "Profile") {
                      if (_flag == 1) {
                        if (_occupation == "student") {
                          return StudentProfile(doc: doc);
                        } else {
                          return TutorProfile(doc: doc);
                        }
                      } else {
                        return AccountType(doc: doc);
                      }
                    } else if (_name == "Student") {
                      return StudentForm(doc: doc);
                    } else if (_name == "Teacher") {
                      print(_adminApproval);
                      if (_adminApproval == 1) {
                        return TutorForm(doc: doc);
                      } else {
                        return AdminApproval(doc: doc);
                      }
                    } else if (_name == "Saved") {
                      return FavList(doc: doc);
                    } else if (_name == "Requests") {
                      return ReqList(doc: doc);
                    } else if (_name == "Faq") {
                      return Faq();
                    } else if (_name == "PrivacyPolicy") {
                      return PrivacyPolicy();
                    }
                  }));
                },
                borderRadius: BorderRadius.circular(24.0),
                //child:Center(
                child: FittedBox(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Image.asset(
                          _img,
                          fit: BoxFit.scaleDown,
                        )),
                    Container(
                        child: Text(
                      _name.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 60),
                    )),
                  ],
                  //),
                )))));
  }
}

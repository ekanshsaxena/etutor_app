import 'dart:io';
import 'package:etutor/screens/profile/student_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:etutor/models/user.dart';
import 'package:etutor/screens/profile/update_student.dart';

class StudentForm extends StatefulWidget {
  var doc;
  StudentForm({this.doc});
  @override
  StudentFormState createState() {
    return StudentFormState();
  }
}

class StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  //text field state
  String name = '';
  int phone = 0;
  int age = 0;
  String gender = '';
  String address = '';
  String standard = '';
  String subjects = '';
  String error = '';
  //image portion
  File _image;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Future getImage() async {
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        //print('Image Path $_image');
      });
    }

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Student Form"),
      ),
      body: Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: <Widget>[
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.black87,
                    child: ClipOval(
                      child: new SizedBox(
                          width: 155.0,
                          height: 155.0,
                          child: (_image != null)
                              ? Image.file(
                                  _image,
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  "assets/images/unpic.png",
                                  fit: BoxFit.fill,
                                )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      size: 30.0,
                    ),
                    onPressed: () {
                      getImage();
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your full name',
                labelText: 'Name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter valid phone number';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  phone = int.parse(value);
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Enter your age :',
                labelText: 'Age',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter valid age';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  age = int.parse(value);
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.account_balance),
                hintText: 'Enter your address',
                labelText: 'Address',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter valid address';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.sentiment_very_satisfied),
                hintText: 'Enter your gender',
                labelText: 'Gender',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter valid gender';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.directions_walk),
                hintText: 'Enter your  Class',
                labelText: 'Class ',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter valid Class';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  standard = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.subject),
                hintText: 'Enter the subject(s) for which you require teacher',
                labelText: 'The subject(s) for which you require teacher ',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter valid subjects';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  subjects = value;
                });
              },
            ),
            new Container(
                padding:
                    const EdgeInsets.only(left: 110.0, right: 130.0, top: 40.0),
                child: new RaisedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    // It returns true if the form is valid, otherwise returns false
                    if (_formKey.currentState.validate() && _image != null) {
                      //print("right1");
                      dynamic result = UpdateStudent(uid: user.uid)
                          .updateStudentDetails(_image, name, phone, age,
                              address, gender, standard, subjects);
                      if (result != null) {
                        //print("right2");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StudentProfile(doc: widget.doc)));
                      } else {
                        setState(() {
                          error = 'Error in Details';
                        });
                      }
                    }
                  },
                )),
            SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

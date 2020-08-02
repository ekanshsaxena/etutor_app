import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          //backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('FAQs'),
        ),
        body: new ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            children: <Widget>[
              Container(
                child: Text(
                  ' 1) What does request button do? \n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' ⫸ The teachers whose details you want to get, and submits the request for that, gets stored here. \n\n',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' 2) What does saved button do? \n',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' ⫸ When you open the profile of any teacher at the top, you find a heart button through which you can see the profile for future viewing! \n\n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '3) What does profile button do? \n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' ⫸ That is for the user to create his profile, both students and teachers can create their profile. \n\n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' 4)  Who are the developers of this app? \n \n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '⫸ This app has been created and developed by Ekansh Saxena, Harsh Verma and Ayush Srivastava \n\n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '5) How can I connect with the developers? \n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' ⫸ You can visit us at  Codebugged.com .  \n\n\n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' Have some other query?\n ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' ⫸ Feel free to connect with us at ***************@gmail.com ! Happy Learning! ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ]));
  }
}

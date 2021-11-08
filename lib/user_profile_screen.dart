import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_app/edit_profile.dart';

class UserProfilePage extends StatefulWidget {

  @override
  _UserProfilePageState createState() => _UserProfilePageState();

}

class _UserProfilePageState extends State<UserProfilePage> {
  var userID = FirebaseAuth.instance.currentUser!.uid;
  //var profileInfo = [];

  var profileName = "";
  var profileEmail = "";

  _UserProfilePageState() {
    var reference = FirebaseDatabase.instance.reference().child("Users/" + userID + "/Profile");
    reference.child("name").once()
        .then((datasnapshot) { // datasnapshot is value returned
      print("Successfully loaded data");
      profileName = datasnapshot.value;
      setState(() {}
      );
    }).catchError((error) {
      print("Failed to load data");
      print(error.toString());
    });

    reference.child("email").once()
        .then((datasnapshot) { // datasnapshot is value returned
      print("Successfully loaded second data");
      profileEmail = datasnapshot.value;
      setState(() {}
      );
    }).catchError((error) {
      print("Failed to load email data");
      print(error.toString());
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: ListView(
        children: [
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container (

            child: Text('Name: ' + profileName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: Text('Email: ' + profileEmail,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, top: 80),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditUserProfilePage()
                  ),
                );

              },
              child: Text('Edit Profile'),
            ),
    ),
        ],
      ),
    ],
    ),
    );
  }
}
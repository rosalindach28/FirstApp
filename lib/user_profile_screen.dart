import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {

  @override
  _UserProfilePageState createState() => _UserProfilePageState();

}

class _UserProfilePageState extends State<UserProfilePage> {
  var userID = FirebaseAuth.instance.currentUser!.uid;
  var profileInfo = [];

  _UserProfilePageState() {
    FirebaseDatabase.instance.reference().child("Users/" + userID + "/Profile").once()
        .then((datasnapshot) { // datasnapshot is value returned
      print("Successfully loaded data");
      print(datasnapshot);
      print("Key:"); // database saves items as key-value pair
      print(datasnapshot.key);
      print("Value:");
      print(datasnapshot.value);

      var profileTempList = [];
      print("Iterating through value map:");
      datasnapshot.value.forEach((k, v) {
        profileTempList.add(v);
  });
      print("Final Subscription List");
      print(profileTempList);
      profileInfo = profileTempList;
      setState(() {
      });
    }).catchError((error) {
      print("Failed to load data");
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // add ListViewBuilder
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Text('Name: ${profileInfo[1]}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Text('Email: ${profileInfo[0]}',
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
                  // TODO
                  // edit fields

                },
                child: Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
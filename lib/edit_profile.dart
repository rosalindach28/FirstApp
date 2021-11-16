import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EditUserProfilePage extends StatefulWidget {

  @override
  _EditUserProfilePageState createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  var newNameController = TextEditingController();
  var newEmailController = TextEditingController();

  var userID = FirebaseAuth.instance.currentUser!.uid;
  var profileName = "";
  var profileEmail = "";

  _EditUserProfilePageState() {
    refreshProfile();
  }

  void refreshProfile() {
    var reference = FirebaseDatabase.instance
        .reference()
        .child("Users/" + userID + "/Profile");
    reference.child("name").once().then((datasnapshot) {
      // datasnapshot is value returned
      // print("Successfully loaded data");
      profileName = datasnapshot.value;
      setState(() {});
    }).catchError((error) {
      print("Failed to load data");
      print(error.toString());
    });

    reference.child("email").once().then((datasnapshot) {
      //  print("Successfully loaded second data");
      profileEmail = datasnapshot.value;
      setState(() {});
    }).catchError((error) {
      print("Failed to load email data");
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(top: 20, bottom: 30, left: 15, right: 15),
                  child: TextField(
                    controller: newNameController
                      ..text = profileName.toString(),
                    onChanged: (text) => newEmailController.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          fontSize: 23,
                          color: Colors.indigo,
                          fontWeight: FontWeight.w700
                      ),
                      suffixIcon: IconButton(
                        onPressed: newNameController.clear,
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                  child: TextField(
                    controller: newEmailController
                      ..text = profileEmail.toString(),
                    onChanged: (text) => newEmailController.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 23,
                          color: Colors.indigo,
                            fontWeight: FontWeight.w700
                      ),
                      suffixIcon: IconButton(
                        onPressed: newEmailController.clear,
                        icon: Icon(Icons.clear),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextButton(
                    child: Text('Save Changes'),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      //update database with new name and/or email address entered by user
                      FirebaseDatabase.instance
                          .reference()
                          .child("Users/" + userID + "/Profile")
                          .child("name")
                          .set(newNameController.text);
                      FirebaseDatabase.instance
                          .reference()
                          .child("Users/" + userID + "/Profile")
                          .child("email")
                          .set(newEmailController.text)
                          .then((value) {
                        showSavedSnackbar(context);
                      }).catchError((error) {
                        print(error.toString());
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSavedSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Changes were saved"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

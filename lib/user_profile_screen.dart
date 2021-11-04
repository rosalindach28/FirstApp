import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {


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
            Container(
              margin: EdgeInsets.only(bottom: 25, right: 40),
              child: Text('Name: Rosalinda ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Text('Email: rch@example.com ',
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
                  textStyle: const TextStyle(fontSize: 18),
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
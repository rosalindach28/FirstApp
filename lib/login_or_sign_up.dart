import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';

class LoginOrSignUpPage extends StatefulWidget {

  @override
  _LoginOrSignUpPageState createState() => _LoginOrSignUpPageState();
}

class _LoginOrSignUpPageState extends State<LoginOrSignUpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In or Sign Up"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Text( 'SubWatch',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )
                ),

            ),

            // Login Button
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 22,
                ),
              ),
              onPressed: () {
               // FirebaseAuth.instance;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()
                  ),
                );
              },
              child: Text(
                  'Log in'
              ),
            ),
        ),
            // Sign Up button here
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 22,
                ),

              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()
                  ),
                );
              },
              child: Text(
                  'Sign Up'
              ),
            ),
          ],
        ),
      ),
    );
  }
}

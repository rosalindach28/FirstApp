import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var email;
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    future:
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
              controller: emailController,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: "name@example.com",
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          ElevatedButton(
            child: Text('Send link'),
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 22,
              ),
            ),
            onPressed: () {
              FirebaseAuth.instance
                  .sendPasswordResetEmail(email: emailController.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

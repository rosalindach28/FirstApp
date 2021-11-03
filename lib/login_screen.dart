import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:my_app/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    future: Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body:  ListView(
        children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              //height: 100,
              margin: EdgeInsets.all(5),
              child: Text('SubWatch',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller:  emailController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "name@example.com",
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
            ),
            // Login button
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text, password: passwordController.text)
                      .then((value) {
                        print("Log in successful!!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()
                          ),
                        );

                  }).catchError((error) {
                    print("Failed to login!!");
                    print(error.toString());
                  });
                },
                child: Text('Login'),
              ),
            ),

            Text('Forgot Password?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  // backgroundColor: Colors.green
                )),
            // Reset Password Button
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 22),
              ),
              onPressed: () {
                // to do code
              },
              child: Text('Reset password',
                  style: TextStyle(
                    fontSize: 20,
                  )
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}

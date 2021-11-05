import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    future: Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body:
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(

              margin: EdgeInsets.only(top: 30, bottom: 20, left: 15, right: 15),
              child: TextField(
                controller: nameController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom:20, right: 15, left: 15),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "name@example.com",
                  labelText: "E-mail address",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            // Container(
            //   margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
            //   child: const TextField(
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Username',
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 22,
              ),

            ),
            onPressed: () {
              // get name, email, password
            print(nameController.text);
              print(emailController.text);
              print(passwordController.text);

              // send to Firebase for authentication

            FirebaseAuth.instance.createUserWithEmailAndPassword(
                 email: emailController.text, password: passwordController.text)
                  .then((value) {
                      print("Sign up was successful");
                      FirebaseDatabase.instance.reference().child('Users/' + value.user!.uid + "/Profile").set(
                        {
                          'name' : nameController.text,
                          'email' : emailController.text
                        }
                      );
                      Navigator.pop(context); // go back to previous screen
              }).catchError((error) {
                print("Sign up failed");
                print(error.toString());
              });
            },
            child: Text(
                'Confirm'
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}
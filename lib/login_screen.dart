import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/reset_password.dart';
import 'main.dart';
import 'package:my_app/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _obscureText = true;

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
            Image(
              image: AssetImage("assets/Sub-Watch-Logo.png"),
              height: 260,
              width: 500,
              //fit: BoxFit.fitWidth,
            ),
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText =! _obscureText;
                      });
                    },
                    child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                obscureText: _obscureText,
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
                              builder: (context) => HomePage.default1()
                          ),
                        );

                  }).catchError((error) {
                    showLoginFailed(context);
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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordPage()
                    ),
                );
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

  void showLoginFailed(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Login failed, try again"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

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
      body: ListView(
        children: [
          Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/Sub-Watch-Logo.png"),
                  height: 290,
                  width: 400,
                  //fit: BoxFit.fitWidth,
                ),
              // Login Button
          Container(
          margin: EdgeInsets.only(bottom: 10 ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                onPressed: () {
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
              Container(
                margin: EdgeInsets.only( bottom: 30),
                child: ElevatedButton(
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
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}

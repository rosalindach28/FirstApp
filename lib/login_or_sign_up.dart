import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                SizedBox(
                  child: Image(
                    image: AssetImage("assets/applogo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                // Login Button
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    child: Text('Log in'),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () {
                      // if already logged in before, app goes directly to home screen
                      SharedPreferences.getInstance().then((prefer) {
                        var loginStatus = prefer.getBool("login");
                        print("Login status is:");
                        print(loginStatus);
                        if (loginStatus != null && loginStatus == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage.default1()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        }
                      });
                    },
                  ),
                ),
                // Sign Up button here
                Container(
                  margin: EdgeInsets.only(bottom: 90),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text('Sign Up'),
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

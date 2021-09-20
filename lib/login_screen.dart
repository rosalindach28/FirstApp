import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SubWatch',
               style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              'Username: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              )
            ),
            Text(
              'Password: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              )
            ),
            // Login button
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 22),
              ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(title: 'Home',)),
                  );
                },
                child: Text(
                  'Login'
                ),
            ),
            Text(
                'Forgot Password?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                   // backgroundColor: Colors.green
                )
            ),
            // Forgot Password Button
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 22),
              ),
              onPressed: () {
                // to do code
              },
              child: Text(
                  'Reset password',
                  style: TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
              )
              ),
            ),
          ],
        ),
      ),

    );
  }
}

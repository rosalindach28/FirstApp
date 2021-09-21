import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _setState() {
    setState(() {
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
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
              child: const TextField(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(title: 'Home',)
                    ),
                  );
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
                textStyle: const TextStyle(fontSize: 22),
              ),
              onPressed: () {
                // to do code
              },
              child: Text('Reset password',
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

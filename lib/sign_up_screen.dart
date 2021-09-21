import 'package:flutter/material.dart';
import 'package:my_app/login_screen.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
   //   _counter++;
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
            // Text(
            //   'Sign Up',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Container(
              margin: EdgeInsets.all(15),
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
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
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 30, right: 15, left: 15),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Confirm Password',
                ),
              ),
            ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 22,
            ),

          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(title: 'Login',)),
            );
          },
          child: Text(
              'Confirm'
          ),
        )
          ],
        ),
      ),
    );
  }
}
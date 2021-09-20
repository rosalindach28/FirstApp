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
      _counter++;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(title: 'Log in to account',)),
    );
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
            Text(
              'Name:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                )
            ),
            Text(
              'Email:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                )
            ),
            Text(
              'Username:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                )
            ),
            Text(
              'Password:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                )
            ),

        // TextButton(
        //   style: TextButton.styleFrom(
        //     textStyle: const TextStyle(fontSize: 22),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => LoginPage(title: 'Log in',)),
        //     );
        //   },
        //   child: Text(
        //       'Confirm',
        //       style: TextStyle(
        //         fontSize: 20,
        //         //fontWeight: FontWeight.bold,
        //   )
        //   ),
        // ),

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
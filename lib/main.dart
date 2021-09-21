import 'package:flutter/material.dart';
import 'login_or_sign_up.dart';
import 'add_new_subscription_screen.dart';
import 'subscription_details_screen.dart';
import 'user_profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubWatch',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginOrSignUpPage(title: 'Log in or Sign Up'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

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
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Your Subscriptions: ',
              // list of active subscriptions
              // listview
              // click subscription go to subscription details

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push( // used to navigate between pages
            context,
            MaterialPageRoute(builder: (context) => AddNewSubPage(title: 'Add New Subscription')),
          );
        },
        tooltip: 'Add Subscription',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

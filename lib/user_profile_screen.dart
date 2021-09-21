import 'package:flutter/material.dart';
import 'add_new_subscription_screen.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  void _incrementCounter() {
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
              margin: EdgeInsets.only(bottom: 25),
              child: Text('Name: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Text('Email: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Text(
                '------------------'
                    ' Manage Subscriptions '
                    '------------------',
                  style: TextStyle(
                    fontSize: 18,
                   // fontWeight: FontWeight.bold,
                  )
              ),
            ),
              // list of active subscriptions
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 80),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // edit fields
                  // To do

                },
                child: Text('Edit Profile'),
              ),
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
      ),
    );
  }
}
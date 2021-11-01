import 'package:flutter/material.dart';
import 'package:my_app/subscription_details_screen.dart';
import 'add_new_subscription_screen.dart';

class UserProfilePage extends StatefulWidget {

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  final List<String> entries = <String>['Netflix', 'Hulu', 'Spotify', 'Amazon Prime'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 25, right: 40),
              child: Text('Name: Rosalinda ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Text('Email: rch@example.com ',
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
              margin: EdgeInsets.only(right: 200),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SubscriptionDetailsPage.default1()),
                  );

                },
                child: Text('Netflix'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 200),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SubscriptionDetailsPage.default1()),
                  );

                },
                child: Text('Hulu'),
              ),
            ),
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewSubPage()),
          );
        },
        tooltip: 'Add Subscription',
        child: Icon(Icons.add),
      ),
    );
  }
}
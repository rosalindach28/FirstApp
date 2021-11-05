import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_app/subscription_details_screen.dart';
import 'login_or_sign_up.dart';
import 'add_new_subscription_screen.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginOrSignUpPage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  //String username = "Rosalinda";
  var userID = FirebaseAuth.instance.currentUser!.uid;
  var subscriptionList = [];

  // Run until a subscription is added
  _MyHomePageState() {
    // load all subscriptions from firebase database and display in ListView
    // subscriptions from database returned as hash map/ dictionary so need to iterate through each,
    // retrieve values and then put the values in list (tempList)
    FirebaseDatabase.instance.reference().child("Users/" + userID + "/Subscriptions").once()
        .then((datasnapshot) { // datasnapshot is value returned
      print("Successfully loaded data");
      print(datasnapshot);
      print("Key:"); // database saves items as key-value pair
      print(datasnapshot.key);
      print("Value:");
      print(datasnapshot.value);
      // iterate through map of all items by using for-each loop
      // k, v is key, value pair
      // then adding each value to list
      var subscriptionTempList = [];
      print("Iterating through value map:");
      datasnapshot.value.forEach((k, v) {
        print(k);
        print(v);
        subscriptionTempList.add(v);
      }); // end of loop
      print("Final Subscription List");
      print(subscriptionTempList);
      subscriptionList = subscriptionTempList;
      setState(() {

      });
    }).catchError((error) {
      print("Failed to load data");
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'SubWatch',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('My Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginOrSignUpPage()
                  ),
                );
              },
            ),
          ],
        ),
      ),

      //TODO
      // put text above ListView builder
      // Service Logos
      // Welcome
      // My Subscriptions

      body: ListView.builder(
          itemCount: subscriptionList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: (){
                print(" Clicked subscription # " + (index+1).toString());

                // go to subscription details page for subscription clicked
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SubscriptionDetailsPage(subscriptionList[index])),
                );
                },

                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         SubscriptionDetailsPage(
                //             name: subNameController.text,
                //             service: serviceController.text,
                //             date: _selectedDate)
                // )
                // );
            title: Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // list of active subscriptions
            Text("     Subscription # " + (index+1).toString()),
            Text('${subscriptionList[index]['subscription name']}',
            style: TextStyle(
            fontWeight: FontWeight.bold
            ),
            ),
            Text('${subscriptionList[index]["service provider"]}',
            style: TextStyle(
            fontWeight: FontWeight.bold
            ),
            ),
            Text('${subscriptionList[index]["due date"]}',
            style: TextStyle(
            fontWeight: FontWeight.bold
            ),
            )
            ],
            ),
            ),
            ),
            );
          }),

    floatingActionButton: FloatingActionButton(
    onPressed: () {
    Navigator.push( // used to navigate between pages
    context,
    MaterialPageRoute(builder: (context) => AddNewSubPage()),
    );
    },
    tooltip: 'Add Subscription',
    child: Icon(Icons.add),
    ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


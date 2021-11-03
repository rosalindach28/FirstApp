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

  String username = "Rosalinda";



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
              title: Text('Profile'),
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
      body: ListView(
    children: [
    Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Image(
        //     image: NetworkImage('https://static.seattletimes.com/wp-content/uploads/2021/09/urn-publicid-ap-org-c043781704b89fd36c1bcce91aa4ef0eTV_Streaming_Obsession_90095-780x355.jpg')
        // ),
        Container(
          margin: EdgeInsets.all(20),
          child: Text( 'Welcome $username',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue
              )
          ),
        ),
        Container(
          //  margin: EdgeInsets.all(15),
          child: Text('Your Subscriptions: ',
              style: TextStyle(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
              )
          ),
        ),
        // list of active subscriptions
        // use listview
        Container(
         // margin: EdgeInsets.all(15),
          child: Text('List of subscriptions here',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              )
          ),
        ),
        // Column(
        //   children: subs.map((sub) => Text('${sub.name}\n ${sub.provider}\n ${sub.price}\n')).toList(),
        // ),
        Container(
          margin: EdgeInsets.only(bottom: 20, top: 80),
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionDetailsPage.default1())
              );

            },
            child: Text('Subscription Details'),
          ),
        ),
      ],
    ),
    ),
    ],
    ),


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


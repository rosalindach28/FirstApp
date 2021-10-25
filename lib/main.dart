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

  String username = "Rosalinda";
  final List<String> entries = <String>['Netflix', 'Hulu', 'Spotify','Amazon Prime'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  MaterialPageRoute(builder: (context) => HomePage(title: 'Home',)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage(title: 'My Profile',)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginOrSignUpPage(title: 'Log in or Sign up',)),
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
          margin: EdgeInsets.all(15),
          child: Text('List of subscriptions here',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              )
          ),
        ),
        Container(
         // margin: EdgeInsets.all(15),
          child: Text('List of subscriptions here',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              )
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20, top: 80),
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionDetailsPage(title: 'Details',))
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
    MaterialPageRoute(builder: (context) => AddNewSubPage(title: 'Add New Subscription')),
    );
    },
    tooltip: 'Add Subscription',
    child: Icon(Icons.add),
    ),

    //   bottomNavigationBar: BottomNavigationBar(
    //       items: <BottomNavigationBarItem>[
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.home),
    //           label: 'Home',
    //
    // ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.account_circle),
    //           label: 'Profile',
    //
    //     ),
    //   ]
    //
    // ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


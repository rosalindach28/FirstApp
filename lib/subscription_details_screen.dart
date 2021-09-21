import 'package:flutter/material.dart';
import 'package:my_app/edit_subscription_screen.dart';

class SubscriptionDetailsPage extends StatefulWidget {
  SubscriptionDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SubscriptionDetailsState createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetailsPage> {

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
              margin: EdgeInsets.all(20),
              child: Text( 'Subscription Details',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )
              ),

            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text('Subscription name: ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )

              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text('Service Provider: ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text('Renewal Date: ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text('Amount Due: ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text('Time remaining until next billing: ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )
              ),
            ),
            // Group 2 buttons in Row
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 90, right: 40),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditSubscriptionPage(title: 'Edit Subscription',)
                        ),
                      );
                    },
                    child: Text('Edit'),
                  ),
                ),
                // Remove Button
                Container(
                 //margin: EdgeInsets.only(left: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      // confirmation message
                      //   ),
                      // );
                    },
                    child: Text('Remove'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
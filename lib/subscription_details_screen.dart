import 'dart:async';
import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_app/edit_subscription_screen.dart';


class SubscriptionDetailsPage extends StatefulWidget {

  var subscriptionDetails;

  SubscriptionDetailsPage(this.subscriptionDetails);

  SubscriptionDetailsPage.default1({this.subscriptionDetails = ""});


  @override
  _SubscriptionDetailsState createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetailsPage> {




  late Timer _timer; // Timer instance variable that will update countdown
// have countdown update in real-time, every hour
//
  @override
  void initState() {
    super.initState();
   _timer = Timer.periodic(const Duration(hours: 1), (timer)
    {
      setState(() {});
    });
  }

  //dispose of timer when countdown is finished
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
 }

  @override
  Widget build(BuildContext context) {
    // time countdown string that will be displayed
  // String timeCounter = CountDown().timeLeft(date, "Subscription Payment Due");


    return Scaffold(
      appBar: AppBar(
        title: Text("Subscription Details"),
      ),
      body: ListView(
        children: [
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   margin: EdgeInsets.only(bottom: 30),
            //   child: Text('Subscription Details',
            //       style: TextStyle(
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold,
            //       )
            //   ),
            // ),

            Container(
              margin: EdgeInsets.only(top: 50, bottom: 30),
              child: Text("Subscription name: ${widget.subscriptionDetails['name']}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text("Service Provider: ${widget.subscriptionDetails['service provider']}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text("Renewal Date: ${widget.subscriptionDetails['renewal date']}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                onPressed: () {
                  print("Works");
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text('Time Remaining:\n',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  );
                },
                child: Text("Set Reminder")
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
                            builder: (context) => EditSubscriptionPage()
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
        ],
      ),
    );
  }
}
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

  // DateTime? dueDate;
  // SubscriptionDetailsPage.date(this.dueDate);

  @override
  _SubscriptionDetailsState createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetailsPage> {

  late Timer _timer; // Timer instance variable that will update countdown
// have countdown update in real-time, every hour
  bool pressed = false;
  bool buttonDisabled = false;
   //DateTime? dueDate;
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
    //time countdown string that will be displayed
  //String timeCounter = CountDown().timeLeft(widget.dueDate, "Subscription Payment Due");


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
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 30),
              child: Text("Name: ${widget.subscriptionDetails['subscription name']}",
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
              child: Text("Payment due date: ${widget.subscriptionDetails['due date']}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
            margin: EdgeInsets.only(bottom: 30),
            child: pressed ? Text('Time Remaining:\n',
            style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            )
            ): SizedBox(),
            ),

            // TODO fix set reminder button to show timer
            Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),

                onPressed: () {
                  setState(() {
                    pressed = true;
                  //  buttonDisabled = true;
                  });
                },
                child: Text("Set Reminder")
                ),
            ),
            // // Group 2 buttons in Row
            // Row(
            //   children: [
                Container(
                 // margin: EdgeInsets.only(bottom: 60),
                  child: TextButton(
                    child: Text('Edit'),
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
                  ),
                ),
                // Remove Button
                // Container(
                //  //margin: EdgeInsets.only(left: 20),
                //   child: TextButton(
                //     child: Text('Remove'),
                //     style: TextButton.styleFrom(
                //       textStyle: const TextStyle(fontSize: 22),
                //     ),
                //     onPressed: () {
                //       // confirmation message
                //     },
                //   ),
                // ),
              ],
        ),
      ),
        ],
      ),
    );
  }
}
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
  bool pressed = false;
  //bool buttonDisabled = false;

  @override
  void initState() {
    super.initState();
    // have countdown update in real-time, every second
   _timer = Timer.periodic(const Duration(seconds: 1), (timer)
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

  // date = 'dec 14, 2021'
  List<int> parseDateMonth( String date){
    List<String> month = [ 'jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug',
      'sep', 'oct', 'nov', 'dec'];
    List<int> list = [];
    List<String> items = date.split(" ");
    int i;
    for(i=0; i<12; i++){
      if(items[0].toLowerCase() == month[i])
        break;
    }
    list.add(i+1);
    list.add( int.parse(items[1].substring(0, items[1].length-1)) );
    list.add( int.parse(items[2]) );
    return list;
  }

  @override
  Widget build(BuildContext context) {

    //TODO get timer to implement monthly and yearly

    //time countdown string that will be displayed

    String deadline = widget.subscriptionDetails['due date'];
    // print(deadline);
    List<int> list = parseDateMonth(deadline);
    // print(list[0]);
    // print(list[1]);
    // print(list[2]);
    DateTime dateTime = DateTime(list[2], list[0], list[1]);
    // notification
    String timeCounter = CountDown().timeLeft(dateTime, "Subscription Payment Due");

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
            child: pressed ? Text('Time Remaining:\n' + timeCounter,
            style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.red
            )
            ): SizedBox(),
            ),

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

              ],
        ),
      ),
        ],
      ),
    );
  }
}
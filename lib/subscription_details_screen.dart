import 'dart:async';

import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_app/edit_subscription_screen.dart';

class SubscriptionDetailsPage extends StatefulWidget {
  SubscriptionDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SubscriptionDetailsState createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetailsPage> {

  static DateTime _selectedDate = DateTime.now();

  Future<void> _chooseDate(BuildContext context)async {
    final DateTime? dateChosen = await DatePicker.showDatePicker(context, showTitleActions: true);
    if (dateChosen != null && dateChosen != _selectedDate){
      setState(() {
        _selectedDate = dateChosen;
      });
    }
  }

  late Timer _timer; // Timer instance variable that will update countdown
// have countdown update in real-time, every second

  @override
  void initState() {
    super.initState();
   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    String timeCounter = CountDown().timeLeft(_selectedDate, "Subscription Payment Due");


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text( 'Subscription Details',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )
              ),

            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text('Subscription name: ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )

              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text('Service Provider: ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text('Renewal Date: ' + DateFormat.yMMMd("en_US").format(_selectedDate),
                    style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text('Amount Due: ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  )
              ),
            ),
            // Text(DateFormat.yMMMd("en_US").format(_selectedDate)),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    _chooseDate(context);
                        child: Text(
                            'Select date of subscription',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                        );
                  },
                  child: Text(
                      'Set Reminder'
                  )
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text('Time Remaining:\n' + timeCounter,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
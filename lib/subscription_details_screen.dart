import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    // have countdown update in real-time, every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    // Asks user for permission to display notifications on the app
    // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    //   if (!isAllowed) {
    //     showDialog(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //               title: Text("Allow Notifications?"),
    //               content:
    //                   Text("This app would like to send you notifications "),
    //               actions: [
    //                 TextButton(
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                   child: Text(
    //                     "Don't Allow",
    //                     style: TextStyle(fontSize: 16),
    //                   ),
    //                 ),
    //                 TextButton(
    //                   onPressed: () => AwesomeNotifications()
    //                       .requestPermissionToSendNotifications()
    //                       .then((_) => Navigator.pop(context)),
    //                   child: Text(
    //                     "Allow",
    //                     style: TextStyle(fontSize: 16),
    //                   ),
    //                 )
    //               ],
    //             ));
    //   }
    // });
  }

  //dispose of timer and notification stream when countdown is finished
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  // date fomat  = 'dec 14, 2021'
  List<int> parseDateMonth(String date) {
    List<String> month = [
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec'
    ];
    List<int> list = [];
    List<String> items = date.split(" ");
    int i;
    for (i = 0; i < 12; i++) {
      if (items[0].toLowerCase() == month[i]) break;
    }
    list.add(i + 1);
    list.add(int.parse(items[1].substring(0, items[1].length - 1)));
    list.add(int.parse(items[2]));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    String deadline = widget.subscriptionDetails['due date'];
    // print(deadline);
    List<int> list = parseDateMonth(deadline);
    // print(list[0]);
    // print(list[1]);
    // print(list[2]);
    DateTime dueDate = DateTime(list[2], list[0], list[1]);
    //time countdown string that will be displayed
    String timeCounter =
        CountDown().timeLeft(dueDate, "Subscription Payment Due");

    //   var newMonthlyDate = new DateTime(
    //       dueDate.year, dueDate.month + 1, dueDate.day);
    // //  String timeCounterMonthly = CountDown().timeLeft(newMonthlyDate, "Monthly payment due");
    //   var newYearlyDate = new DateTime(
    //       dueDate.year + 1, dueDate.month, dueDate.day);
    //  // String timeCounterYearly = CountDown().timeLeft(newMonthlyDate, "Yearly payment due");

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
                  child: Text(
                      "Name: ${widget.subscriptionDetails['subscription name']}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                      "Service Provider: ${widget.subscriptionDetails['service provider']}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                      "Payment due date: ${widget.subscriptionDetails['due date']}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text('Time Remaining:\n' + timeCounter,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo))),
                // Implement notifications
                // Container(
                //   margin: EdgeInsets.only(bottom: 30),
                //   child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         textStyle: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       onPressed: () {
                //         scheduleNotification();
                //         AwesomeNotifications().createdStream.listen((event) {
                //           showSendNotification(context);
                //         });
                //       },
                //       child: Text("Schedule notification")
                //   ),
                // ),
                // Group 2 buttons in Row
                //Implement monthly and yearly timer based on date
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       child: TextButton(
                //           child: Text('Repeat monthly'),
                //           style: TextButton.styleFrom(
                //             textStyle: const TextStyle(fontSize: 22),
                //           ),
                //           onPressed: () {
                //             timeCounterDefault = CountDown().timeLeft(
                //                 newMonthlyDate, " Monthly Subscription Payment Due");
                //             showMonthlyReminder(context, DateFormat.yMMMd(
                //                 "en_US").format(newMonthlyDate));
                //           }
                //       ),
                //     ),
                //     Container(
                //       child: TextButton(
                //         child: Text('Repeat yearly'),
                //         style: TextButton.styleFrom(
                //           textStyle: const TextStyle(fontSize: 22),
                //         ),
                //         onPressed: () {
                //           //  print(newYearlyDate);
                //           dueDate = newYearlyDate;
                //           showYearlyReminder(context, DateFormat.yMMMd("en_US")
                //               .format(newYearlyDate));
                //         },
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

// Yearly and monthly reminders
// void showMonthlyReminder(BuildContext context, String monthlyDate) {
//   final snackBar = SnackBar(
//     content: Text("Next reminder set for " + monthlyDate),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
//
// void showYearlyReminder(BuildContext context, String yearlyDate) {
//   final snackBar = SnackBar(
//     content: Text("Next reminder set for " + yearlyDate),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }

// Scheduled notification reminder and implementation for one day before payment due date
// void showSendNotification(BuildContext context) {
//   final snackBar = SnackBar(
//     content: Text(
//         "You will be notified when 1 day is remaining to pay the subscription."),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
// void scheduleNotification() async {
//   String deadline = widget.subscriptionDetails['due date'];
//   List<int> list = parseDateMonth(deadline);
//   DateTime dueDate = DateTime(list[2], list[0], list[1]);
//   var oneDayLeft = new DateTime(dueDate.year, dueDate.month, dueDate.day - 1);
//   await AwesomeNotifications().createNotification(
//   content: NotificationContent(
//       id: 10,
//       channelKey: 'basic_channel',
//       title: 'SubWatch app',
//       body: 'Subscription payment due tomorrow!',
//   ),
//     schedule: NotificationCalendar.fromDate(date: oneDayLeft),
//   );
// }

} // end of class

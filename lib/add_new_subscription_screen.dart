import 'dart:async';

import 'package:date_count_down/countdown.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_app/main.dart';
import 'subscription_details_screen.dart';
import 'package:date_field/date_field.dart';

class AddNewSubPage extends StatefulWidget {

  @override
  _AddNewSubPageState createState() => _AddNewSubPageState();
}

class _AddNewSubPageState extends State<AddNewSubPage> {
  var subNameController = TextEditingController();
  var serviceController = TextEditingController();
  var dateController = TextEditingController();


DateTime _selectedDate = DateTime.now();

Future<void> _chooseDate(BuildContext context)async {
  final DateTime? dateChosen = await DatePicker.showDatePicker(context, showTitleActions: true);
  if (dateChosen != null && dateChosen != _selectedDate){
    setState(() {
      _selectedDate = dateChosen;
    });
  }
}


  // @override
  // void initState() {
  //   super.initState();
  //    subNameController = TextEditingController();
  //    serviceController = TextEditingController();
  //    dateController = TextEditingController();
  //  // _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {});
  //  // });
  // }

// //dispose of timer when countdown is finished
// @override
// void dispose() {
//   super.dispose();
//   _timer.cancel();
// }


  @override
  Widget build(BuildContext context) {
   //  String timeCounter = CountDown().timeLeft(_selectedDate, "Subscription Payment Due");
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Subscription"),
      ),
      body: ListView(
        children: [
      Center(
      child: Column(

      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 40, right: 15, left: 15, bottom: 20),
            child: TextField(
              controller: subNameController,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Subscription Name',
                  labelStyle: TextStyle(
                    fontSize: 16,
                  )

              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
              child: TextField(
                controller: serviceController,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Service Provider',
                    labelStyle: TextStyle(
                      fontSize: 16,
                    )
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(right: 15, left: 15, bottom: 40),
            //   child: TextField(
            //     controller: priceController,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Price (optional)',
            //         labelStyle: TextStyle(
            //           fontSize: 16,
            //         )
            //     ),
            //   ),
            // ),
          Container(
            margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
            child: TextField(
                controller: dateController,
                obscureText: false,
                 decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Renewal date',
                  labelStyle: TextStyle(
                    fontSize: 16,
                  )
                 ),
                onTap: () async {
                 await _chooseDate(context);
                  dateController.text = DateFormat.yMMMd("en_US").format(_selectedDate);
                  print(dateController.text);
                }
                ),
          ),

          // Container(
          //   margin: EdgeInsets.only(bottom: 30),
          //   child: Text('Time Remaining:\n' + timeCounter,
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //       )
          //   ),
          // ),
                Container(
                  margin: EdgeInsets.only(bottom: 90),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      //saveSubscription();
                      print(subNameController.text);
                      print(serviceController.text);
                      print(dateController.text);

                      // send to FireBase

                      FirebaseDatabase.instance.reference().child('Users/Subscriptions/').set(
                          {
                            "name" : subNameController.text,
                            "service provider" : serviceController.text,
                            "renewal date" : dateController.text
                          }
                      ).then((value) {
                        print("Successfully added subscription to database");
                      }).catchError((error) {
                        print("Failed to add" + error.toString());
                      });

                      // pass data to sub details screen and home screen

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SubscriptionDetailsPage(
                                  name: subNameController.text,
                                  service: serviceController.text,
                                  date: _selectedDate)
                      )
                      );
                      //
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => HomePage(title: 'Home',)),
                      //     // update homepage
                      //   );
                    },
                    child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ),
              ],
        ),
        ),
      ],
      ),
    );
  }
  // void saveSubscription() {
  //   String name = subNameController.text;
  //   String service = serviceController.text;
  //   String date = dateController.text;
  //
  //   Map<String,String> subscription = {
  //     'name': name,
  //     'service provider': service,
  //     'renewal date': date,
  //   };



  }


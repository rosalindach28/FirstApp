import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AddNewSubPage extends StatefulWidget {

  @override
  _AddNewSubPageState createState() => _AddNewSubPageState();
}

class _AddNewSubPageState extends State<AddNewSubPage> {
  var subNameController = TextEditingController();
  var serviceController = TextEditingController();
  var dateController = TextEditingController();
  var userID = FirebaseAuth.instance.currentUser!.uid;
  DateTime _selectedDate = DateTime.now();


Future<void> _chooseDate(BuildContext context)async {
  final DateTime? dateChosen = await DatePicker.showDatePicker(context, showTitleActions: true);
  if (dateChosen != null && dateChosen != _selectedDate){
    setState(() {
      _selectedDate = dateChosen;
    });
  }
}

  @override
  Widget build(BuildContext context) {
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
                  margin: EdgeInsets.only(
                      top: 40, right: 15, left: 15, bottom: 20),
                  child: TextField(
                    controller: subNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Subscription Name',
                        labelStyle: TextStyle(
                          fontSize: 20,

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
                          fontSize: 20,
                        )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
                  child: TextField(
                      controller: dateController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Due date',
                          labelStyle: TextStyle(
                            fontSize: 20,
                          )
                      ),
                      onTap: () async {
                        await _chooseDate(context);
                        dateController.text =
                            DateFormat.yMMMd("en_US").format(_selectedDate);
                        print(dateController.text);
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 90),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      // print(subNameController.text);
                      // print(serviceController.text);
                      // print(dateController.text);
                      //  send to FireBase
                      FirebaseDatabase.instance.reference().child("Users/" +
                          userID + "/Subscriptions/").push().set(
                          {
                            "subscription name": subNameController.text,
                            "service provider": serviceController.text,
                            "due date": dateController.text
                          }
                      ).then((value) {
                        print("Successfully added subscription to database");
                      }).catchError((error) {
                        print("Failed to add" + error.toString());
                      });

                      // Go back to home screen
                      // Note: Need to run app again to update home screen when adding new subscription
                      Navigator.pop(context);
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
  }




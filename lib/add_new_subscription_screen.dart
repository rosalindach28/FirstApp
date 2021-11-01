import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
  var priceController = TextEditingController();

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
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 40),
              child: TextField(
                controller: priceController,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price (optional)',
                    labelStyle: TextStyle(
                      fontSize: 16,
                    )
                ),
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
                  // print(priceController.text);

                  // send to FireBase


                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubscriptionDetailsPage(name: subNameController.text, service: serviceController.text, price: priceController.text)));
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
}

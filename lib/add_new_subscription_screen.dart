import 'package:flutter/material.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_app/main.dart';
import 'subscription_details_screen.dart';
import 'package:date_field/date_field.dart';

class AddNewSubPage extends StatefulWidget {
  AddNewSubPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddNewSubPageState createState() => _AddNewSubPageState();
}

class _AddNewSubPageState extends State<AddNewSubPage> {
  TextEditingController subNameController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(title: 'Home',)),
                    // update homepage
                  );
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

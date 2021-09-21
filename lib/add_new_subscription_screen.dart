import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:date_field/date_field.dart';

class AddNewSubPage extends StatefulWidget {
  AddNewSubPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddNewSubPageState createState() => _AddNewSubPageState();
}

class _AddNewSubPageState extends State<AddNewSubPage> {
  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
    //  _counter++;
    });
  }

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
              margin: EdgeInsets.all(15),
              child: const TextField(
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
              margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
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
              margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
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
              margin: EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintText: 'Choose subscription date',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black54
                  ),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                ),
                mode: DateTimeFieldPickerMode.date,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  print(value);
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 18,
                ),

              ),
              onPressed: () {
                // show 'reminder set' message (optional)
              },
              child: Text(
                  'Set Reminder'
              ),
            ),
            TextButton(
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
          ],
        ),
      ),
    );
  }
}

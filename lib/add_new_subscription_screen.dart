import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

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
            Text(
              'Subscription Name: ',
                style: TextStyle(
                  fontSize: 20,
                //  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )
            ),
            Text(
                'Service Provider: ',
                style: TextStyle(
                  fontSize: 20,
                 // fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )
            ),
            Text(
                'Renewal Date: ',
                style: TextStyle(
                  fontSize: 20,
               //   fontWeight: FontWeight.bold,
                  color: Colors.black,
                )
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

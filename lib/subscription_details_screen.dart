import 'package:flutter/material.dart';

class SubscriptionDetailsPage extends StatefulWidget {
  SubscriptionDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SubscriptionDetailsState createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetailsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
              'Subscription Details',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Subscription name: ',
            ),
            Text(
              'Service Provider:',
            ),
            Text(
              'Renewal Date ',
            ),
            Text(
              'Amount Due:',
            ),
            Text(
              'Time remaining until next billing:',
            ),
            //Text(
            //'$_counter',
            // style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      // add edit and remove button
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
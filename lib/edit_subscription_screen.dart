import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class EditSubscriptionPage extends StatefulWidget {
  EditSubscriptionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _EditSubscriptionPageState createState() => _EditSubscriptionPageState();
}

class _EditSubscriptionPageState extends State<EditSubscriptionPage> {

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
              margin: EdgeInsets.only(bottom: 15),
              child: Text('Subscription name ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text('Service provider ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text('Renewal Date ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            // Save changes button
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  // confirmation message then go home
                  // home updates subscriptions
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(title: 'Home',)
                    ),
                  );
                },
                child: Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

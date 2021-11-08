import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class EditSubscriptionPage extends StatefulWidget {

  var subscriptionDetails;
  

  @override
  _EditSubscriptionPageState createState() => _EditSubscriptionPageState();
}

class _EditSubscriptionPageState extends State<EditSubscriptionPage> {

  var newSubNameController = TextEditingController();
  var newServiceController = TextEditingController();
  var newDateController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Subscription"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
              child: TextField(
                controller: newSubNameController,
                obscureText: false,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
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
                controller: newServiceController,
                obscureText: false,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
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
                controller: newDateController,
                obscureText: false,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                    labelText: 'Payment due date',
                    labelStyle: TextStyle(
                      fontSize: 20,
                    )
                ),
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
                        builder: (context) => HomePage()
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

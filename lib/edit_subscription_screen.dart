import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class EditSubscriptionPage extends StatefulWidget {
  var subscriptionDetails;
  var index;

  EditSubscriptionPage(this.subscriptionDetails, this.index);

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
      body: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
                child: TextField(
                  controller: newSubNameController
                    ..text =
                        "${widget.subscriptionDetails['subscription name']}",
                  onChanged: (text) => newSubNameController.text,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Subscription Name',
                    labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    suffixIcon: IconButton(
                      onPressed: newSubNameController.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
                  child: TextField(
                    controller: newServiceController
                      ..text =
                          "${widget.subscriptionDetails['service provider']}",
                    onChanged: (text) => newServiceController.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Service Provider',
                      labelStyle: TextStyle(
                          color: Colors.indigo,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      suffixIcon: IconButton(
                        onPressed: newServiceController.clear,
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
                child: TextField(
                  controller: newDateController
                    ..text = "${widget.subscriptionDetails['due date']}",
                  onChanged: (text) => newDateController.text,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'New payment due date',
                    helperText: "Format: Nov 27, 2022",
                    helperStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    suffixIcon: IconButton(
                      onPressed: newDateController.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
              // Save changes button
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextButton(
                  child: Text('Save Changes'),
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 22),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    showSaveChangesSnackBar(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                              newSubNameController.text,
                              newServiceController.text,
                              newDateController.text,
                              widget.index,
                              1)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void showSaveChangesSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Changes saved"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

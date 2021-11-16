import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_app/main.dart';

class EditSubscriptionPage extends StatefulWidget {

  var subscriptionDetails;
  EditSubscriptionPage(this.subscriptionDetails);

  @override
  _EditSubscriptionPageState createState() => _EditSubscriptionPageState();
}

class _EditSubscriptionPageState extends State<EditSubscriptionPage> {
  var newSubNameController = TextEditingController();
  var newServiceController = TextEditingController();
  var newDateController = TextEditingController();


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
        title: Text("Edit Subscription"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
              child: TextField(
                controller: newSubNameController
                  ..text = "${widget.subscriptionDetails['subscription name']}",
                onChanged: (text) => newSubNameController.text,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Subscription Name',
                  labelStyle: TextStyle(
                   color: Colors.indigo,
                  fontSize: 22,
                   fontWeight: FontWeight.bold
                  ),
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
                  ..text = "${widget.subscriptionDetails['service provider']}",
                onChanged: (text) => newServiceController.text,
                obscureText: false,
                decoration: InputDecoration(
                    labelText: 'Service Provider',
                    labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  suffixIcon: IconButton(
                  onPressed: newServiceController.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
            )
            ),
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
              child: TextField(
                controller: newDateController,
                obscureText: false,
                decoration: InputDecoration(
                    labelText: 'New payment due date',
                      labelStyle: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                    ),
                //   suffixIcon: IconButton(
                //   onPressed: newDateController.clear,
                //   icon: Icon(Icons.clear),
                // ),
              ),
                  onTap: () async {
                    await _chooseDate(context);
                    newDateController.text =
                        DateFormat.yMMMd("en_US").format(_selectedDate);
                    print(newDateController.text);
                  }
            ),
            ),
            // Save changes button
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextButton(
                child: Text('Confirm'),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  //showSaveChangesSnackbar(context);
                  print(newSubNameController.text);
                  print(newServiceController.text);
                  print(newDateController.text);
                  Navigator.pop(context);
                  showSaveChangesSnackbar(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(newSubNameController.text, newServiceController.text, newDateController.text)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSaveChangesSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Press update to see changes"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }


}

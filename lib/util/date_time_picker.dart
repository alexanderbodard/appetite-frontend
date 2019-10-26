import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:appetite/constants.dart';
import 'package:appetite/widgets/restaurant.dart';

import 'package:flutter/cupertino.dart';

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final controller;

  BasicDateTimeField(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        child: Text('Please enter the desired date and time'),
        padding: EdgeInsets.all(12),
      ),
      DateTimeField(
        controller: controller,
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}

Widget dateTimeComponent(RestaurantState restaurantState) => MaterialApp(
  home: MyHomePage(restaurantState),
  theme: ThemeData.light().copyWith(
      inputDecorationTheme:
      InputDecorationTheme(border: OutlineInputBorder())),
);

class MyHomePage extends StatefulWidget {
  final RestaurantState restaurantState;

  MyHomePage(this.restaurantState);

  @override
  MyHomePageState createState() => MyHomePageState(restaurantState);
}

class MyHomePageState extends State<MyHomePage> {
  final RestaurantState restaurantState;

  MyHomePageState(this.restaurantState);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[
            DateTimeForm(restaurantState),
          ],
        ));
  }
}

class DateTimeForm extends StatefulWidget {
  final RestaurantState restaurantState;

  DateTimeForm(this.restaurantState);

  @override
  _DateTimeFormState createState() => _DateTimeFormState(restaurantState);
}

class _DateTimeFormState extends State<DateTimeForm> {
  final RestaurantState restaurantState;

  final dateController = TextEditingController();
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dateController.dispose();
    textController.dispose();
    super.dispose();
  }

  _DateTimeFormState(this.restaurantState);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text('Fill in the reservation form', style: TextStyle(fontSize: 24)),
            padding: EdgeInsets.only(
              top: 16,
              bottom: 38
            ),
            alignment: Alignment.center,
          ),
          BasicDateTimeField(dateController),
          Container(
            child: Text('Please enter the number of attendees'),
            padding: EdgeInsets.only(
              top: 20,
              bottom: 10
            ),
            alignment: Alignment.center,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: textController,
          ),
          SizedBox(height: 24),
          Padding(padding: EdgeInsets.all(25)),
          Center(child: ButtonTheme(
            child: RaisedButton(
              child: Text('Reserve spot', style: TextStyle(fontSize: 24, color: Colors.white)),
              onPressed: () {
                restaurantState.setState(() { restaurantState.reservationDate = dateController.text; restaurantState.reservationAmount = int.parse(textController.text); });
              },
              color: Color(Constants.kotszakske),
            ),
            minWidth: 320,
            height: 50,
          ))
        ],
      ),
    );
  }
}

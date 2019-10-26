import 'package:flutter/material.dart';
import 'package:appetite/constants.dart';
import 'package:appetite/account.dart';

class Util {
  static AppBar appBar(String title, BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Account()));
          },
          child: Text("⋯", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ],
      backgroundColor: Color(Constants.kotszakske),
    );
  }
}
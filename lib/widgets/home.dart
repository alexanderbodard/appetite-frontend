// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:appetite/widgets/restaurant.dart';
import 'package:appetite/widgets/constants.dart';
import 'package:appetite/util/appbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appetite',
      home: _Home()
    );
  }
}

class _Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.appBar('Welcome to Appetite', context),
      body: Container(
        child: Column(
          children: <Widget>[
            _Picture(),
            _Selection()
          ],
        ),
        color: Colors.white,
      )
    );
  }
}

class _Picture extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/Appetite wit.png'
      ),
      margin: const EdgeInsets.only(
        top: 100.0,
        bottom: 60.0
      )
    );
  }
}

class _Selection extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: _SelectionOptions(),
      padding: const EdgeInsets.only(
        bottom: 20.0,
        top: 20.0
      ),
      margin: const EdgeInsets.all(30.0)
    );
  }
}

class _SelectionOptions extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        _QRSelection(),
        _ManualSelection(),
      ],
    );
  }
}

class _QRSelection extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: ButtonTheme(
        minWidth: 240.0,
        buttonColor: Color(Constants.kotszakske),
        child: RaisedButton(
          child: Text('Scan a QR code'),
          onPressed: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text('Alert'),
                content: Text('You entered a QR code'),
              ),
            );

            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Restaurant()));
          },
        )
      )
    );
  }
}

class _ManualSelection extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: ButtonTheme(
        minWidth: 240.0,
        buttonColor: Color(Constants.kotszakske),
        child: RaisedButton(
          child: Text('Enter a widgets.restaurant manually'),
          onPressed: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text('Alert'),
                content: Text('You entered a widgets.restaurant manually'),
              ),
            );

            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Restaurant()));
          },
        )
      )
    );
  }
}
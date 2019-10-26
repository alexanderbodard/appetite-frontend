import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:appetite/restaurant/menu_body.dart';
import 'package:appetite/restaurant/orders_body.dart';
import 'package:appetite/restaurant/account_body.dart';

class Restaurant extends StatefulWidget {
  RestaurantState createState() => RestaurantState();
}

class RestaurantState extends State<Restaurant> {
  String _tab = 'Menu';

  void setTab(String tab) {
    setState(() =>_tab = tab);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Menu'),
        backgroundColor: Color(Constants.kotszakske),
      ),
      body: _Body(this),
      persistentFooterButtons: <Widget>[
        _MenuButton(this),
        _AccountButton(this),
        _OrdersButton(this),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  RestaurantState parent;

  _Body(this.parent);

  Widget build(BuildContext context) {
    if (this.parent._tab == 'Menu') {
      return MenuBody();
    }
    if (this.parent._tab == 'Account') {
      return AccountBody();
    }
    if (this.parent._tab == 'Orders') {
      return OrdersBody();
    }
  }
}

class _AccountButton extends StatelessWidget {
  RestaurantState parent;

  _AccountButton(this.parent);

  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Account'),
      onPressed: () {
        parent.setTab('Account');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
      color: parent._tab == 'Account' ? Colors.lightBlue : Colors.white
    );
  }
}

class _MenuButton extends StatelessWidget {
  RestaurantState parent;

  _MenuButton(this.parent);

  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Menu'),
      onPressed: () {
        parent.setTab('Menu');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
      color: parent._tab == 'Menu' ? Colors.lightBlue : Colors.white
    );
  }
}

class _OrdersButton extends StatelessWidget {
  RestaurantState parent;

  _OrdersButton(this.parent);

  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Orders'),
      onPressed: () {
        parent.setTab('Orders');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
      color: parent._tab == 'Orders' ? Colors.lightBlue : Colors.white
    );
  }
}

import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:appetite/restaurant/menu_body.dart';
import 'package:appetite/restaurant/orders_body.dart';
import 'package:appetite/util/appbar.dart';


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
      appBar: Util.appBar('Restaurant', context),
      body: _Body(this),
      persistentFooterButtons: <Widget>[
        _MenuButton(this),
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
      child: Image.asset('assets/icons/account_' + (parent._tab == 'Account' ? 'selected' : 'normal') + '.png', width: 50),
      onPressed: () {
        parent.setTab('Account');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  RestaurantState parent;

  _MenuButton(this.parent);

  Widget build(BuildContext context) {
    return FlatButton(
      child: Image.asset('assets/icons/menu_' + (parent._tab == 'Menu' ? 'selected' : 'normal') + '.png', width: 50),
      onPressed: () {
        parent.setTab('Menu');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
    );
  }
}

class _OrdersButton extends StatelessWidget {
  RestaurantState parent;

  _OrdersButton(this.parent);

  Widget build(BuildContext context) {
    return FlatButton(
      child: Image.asset('assets/icons/orders_' + (parent._tab == 'Orders' ? 'selected' : 'normal') + '.png', width: 50),
      onPressed: () {
        parent.setTab('Orders');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
    );
  }
}

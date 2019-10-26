import 'package:flutter/material.dart';
import 'package:appetite/constants.dart';
import 'package:appetite/widgets/restaurant/menu_body.dart';
import 'package:appetite/widgets/restaurant/orders_body.dart';
import 'package:appetite/widgets/restaurant/users_body.dart';
import 'package:appetite/widgets/restaurant/reservations_body.dart';
import 'package:appetite/util/appbar.dart';


class Restaurant extends StatefulWidget {
  bool reserved;
  bool onSpot;

  Restaurant(this.reserved, this.onSpot);

  RestaurantState createState() => RestaurantState(reserved, onSpot);
}

class RestaurantState extends State<Restaurant> {
  String _tab = 'Reservations';
  bool reserved;
  bool onSpot;

  RestaurantState(this.reserved, this.onSpot);

  void setTab(String tab) {
    setState(() =>_tab = tab);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.appBar(_tab, context),
      body: _Body(this),
      persistentFooterButtons: <Widget>[
        _MenuButton(this),
        _OrdersButton(this),
        _UsersButton(this),
        _ReservationsButton(this),
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
    if (this.parent._tab =='Users') {
      return UsersBody();
    }
    if (this.parent._tab == 'Reservations') {
      return ReservationsBody(parent);
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

class _UsersButton extends StatelessWidget {
  RestaurantState parent;

  _UsersButton(this.parent);

  Widget build(BuildContext context) {
    return FlatButton(
      child: Image.asset('assets/icons/orders_' + (parent._tab == 'Users' ? 'selected' : 'normal') + '.png', width: 50),
      onPressed: () {
        parent.setTab('Users');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
    );
  }
}

class _ReservationsButton extends StatelessWidget {
  RestaurantState parent;

  _ReservationsButton(this.parent);

  Widget build(BuildContext context) {
    return FlatButton(
      child: Image.asset('assets/icons/reservations_' + (parent._tab == 'Reservations' ? 'selected' : 'normal') + '.png', width: 50),
      onPressed: () {
        parent.setTab('Reservations');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
    );
  }
}

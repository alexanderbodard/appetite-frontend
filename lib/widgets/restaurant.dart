import 'package:flutter/material.dart';
import 'package:appetite/constants.dart';
import 'package:appetite/widgets/restaurant/menu_body.dart';
import 'package:appetite/widgets/restaurant/orders_body.dart';
import 'package:appetite/widgets/restaurant/users_body.dart';
import 'package:appetite/widgets/restaurant/reservation_body.dart';
import 'package:appetite/util/appbar.dart';


class Restaurant extends StatefulWidget {
  String reservationDate = null;
  int reservationAmount = 0;
  bool onSpot;

  Restaurant(this.onSpot);

  RestaurantState createState() => RestaurantState(onSpot);
}

class RestaurantState extends State<Restaurant> {
  String _tab = 'Reservation';
  String reservationDate = null;
  int reservationAmount = 0;
  bool onSpot;

  RestaurantState(this.onSpot);

  void setTab(String tab) {
    setState(() =>_tab = tab);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.appBar(_tab, context),
      body: _Body(this),
      persistentFooterButtons: <Widget>[
        _ReservationButton(this),
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
      return MenuBody(parent);
    }
    if (this.parent._tab == 'Orders') {
      return OrdersBody();
    }
    if (this.parent._tab =='Users') {
      return UsersBody();
    }
    if (this.parent._tab == 'Reservation') {
      return ReservationBody(parent);
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

class _ReservationButton extends StatelessWidget {
  RestaurantState parent;

  _ReservationButton(this.parent);

  Widget build(BuildContext context) {
    return FlatButton(
      child: Image.asset('assets/icons/reservation_' + (parent._tab == 'Reservation' ? 'selected' : 'normal') + '.png', width: 50),
      onPressed: () {
        parent.setTab('Reservation');
      },
      padding: const EdgeInsets.only(
        left: Constants.flatButtonPadding,
        right: Constants.flatButtonPadding,
      ),
    );
  }
}

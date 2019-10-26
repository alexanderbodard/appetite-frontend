import 'package:flutter/material.dart';
import 'package:appetite/widgets/restaurant.dart';
import 'package:appetite/util/date_time_picker.dart';

class ReservationsBody extends StatelessWidget {
  final RestaurantState restaurantState;

  ReservationsBody(this.restaurantState);

  Widget build(BuildContext context) {
    if (restaurantState.reserved) {
      return Reserved();
    } else if (restaurantState.onSpot) {
      return OnSpot();
    } else {
      return NotReserved();
    }
  }
}

class Reserved extends StatelessWidget {
  Widget build(BuildContext context) {
    return Text('You have already reserved a spot!');
  }
}

class OnSpot extends StatelessWidget {
  Widget build(BuildContext context) {
    return Text("You're already at the restaurant, no need to reserve a spot!");
  }
}

class NotReserved extends StatelessWidget {
  Widget build(BuildContext context) {
    return dateTimeComponent();
  }
}

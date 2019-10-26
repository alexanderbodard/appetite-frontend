import 'package:flutter/material.dart';
import 'package:appetite/widgets/restaurant.dart';
import 'package:appetite/util/date_time_picker.dart';

class ReservationBody extends StatelessWidget {
  final RestaurantState restaurantState;

  ReservationBody(this.restaurantState);

  Widget build(BuildContext context) {
    if (restaurantState.reserved) {
      return Reserved();
    } else if (restaurantState.onSpot) {
      return OnSpot();
    } else {
      return NotReserved(restaurantState);
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
  final RestaurantState restaurantState;

  NotReserved(this.restaurantState);

  Widget build(BuildContext context) {
    return dateTimeComponent(restaurantState);
  }
}

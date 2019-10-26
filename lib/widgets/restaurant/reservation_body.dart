import 'package:flutter/material.dart';
import 'package:appetite/widgets/restaurant.dart';
import 'package:appetite/util/date_time_picker.dart';

class ReservationBody extends StatelessWidget {
  final RestaurantState restaurantState;

  ReservationBody(this.restaurantState);

  Widget build(BuildContext context) {
    if (restaurantState.reservationDate != null) {
      return Reserved(restaurantState);
    } else if (restaurantState.onSpot) {
      return OnSpot();
    } else {
      return NotReserved(restaurantState);
    }
  }
}

class Reserved extends StatelessWidget {
  final RestaurantState restaurantState;

  Reserved(this.restaurantState);

  Widget build(BuildContext context) {
    return GoodToGo("Your reservation on\n${restaurantState.reservationDate.replaceFirst(' ', ' at ')}\nfor ${restaurantState.reservationAmount} people\nhas been confirmed.\n\nYou're good to go!");
  }
}

class OnSpot extends StatelessWidget {
  Widget build(BuildContext context) {
    return GoodToGo("You're already at the restaurant, no need to reserve a spot!");
  }
}

class GoodToGo extends StatelessWidget {
  final String text;

  GoodToGo(this.text);

  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Padding(padding: EdgeInsets.only(
          top: 60,
        )),
        Container(
          child: Image.asset('assets/vink.png'),
          margin: EdgeInsets.only(
            left: 30
          )
        ),
        Text(text, style: TextStyle(fontSize: 22), textAlign: TextAlign.center)
      ]
    ));
  }
}

class NotReserved extends StatelessWidget {
  final RestaurantState restaurantState;

  NotReserved(this.restaurantState);

  Widget build(BuildContext context) {
    return dateTimeComponent(restaurantState);
  }
}

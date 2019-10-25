import 'package:flutter/material.dart';

class Restaurant extends StatefulWidget {
  RestaurantState createState() => RestaurantState();
}

class RestaurantState extends State<Restaurant> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant menu')
      ),
      body: Text('This is the restaurant menu')
    );
  }
}

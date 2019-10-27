import 'package:appetite/types/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Restaurant>> fetchRestaurants() async {
  final response =
    await http.get("http://dondernemers.be/api/v1/Venue/");

  if (response.statusCode == 200) {
    return List<Restaurant>.from(json.decode(response.body).map(
            (restaurant) => Restaurant.fromJson(restaurant)
    ));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load restaurants: ' + response.statusCode.toString());
  }
}

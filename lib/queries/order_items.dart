import 'package:appetite/types/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Order>> fetchOrders() async {
  final response =
    await http.get("http://dondernemers.be/api/v1/Order/");

  if (response.statusCode == 200) {
    return List<Order>.from(json.decode(response.body).map(
      (order) => Order.fromJson(order)
    ));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load menu items: ' + response.statusCode.toString());
  }
}

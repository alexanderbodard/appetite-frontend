import 'package:appetite/types/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<MenuItem> fetchMenuItem(int id) async {
  final response =
    await http.get("http://dondernemers.be/api/v1/MenuItem/$id/");

  if (response.statusCode == 200) {
    return MenuItem.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load menu item: ' + response.statusCode.toString());
  }
}

Future<OrderItem> fetchOrderItem(int id) async {
  final response =
  await http.get("http://dondernemers.be/api/v1/OrderItem/$id/");

  if (response.statusCode == 200) {
    Map jsn = json.decode(response.body);
    MenuItem menuItem = await fetchMenuItem(jsn['item']);

    return OrderItem.fromJson(jsn, menuItem);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load menu item: ' + response.statusCode.toString());
  }
}

Future<List<Order>> fetchOrders() async {
  final response =
    await http.get("http://dondernemers.be/api/v1/Order/");

  if (response.statusCode == 200) {
    List<Order> orders = [];
    List<OrderItem> orderItems = [];

    for (var order in json.decode(response.body)) {
      orderItems = [];
      
      for (var orderItem in order['items']) {
        orderItems.add(await fetchOrderItem(orderItem));
      }

      orders.add(Order(orderItems, order['created_at'].split('T')[0]));
    }

    return orders;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load orders: ' + response.statusCode.toString());
  }
}

import 'package:appetite/types/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void pushOrderItem(MenuItem menuItem, int orderId) async {
  http.post("http://dondernemers.be/api/v1/OrderItem/", body: {'amount': menuItem.count.toString(), 'order': orderId.toString(), 'item': menuItem.id.toString()}).then((http.Response response) {
    if (response.statusCode == 201) {

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to push order: ' + response.statusCode.toString());
    }
  });
}

void pushOrder(List<MenuItem> menuItems) async {
  http.post("http://dondernemers.be/api/v1/Order/", body: {'status': 'pending', 'table': '1'}).then((http.Response response) {
    if (response.statusCode == 201) {
      int id = json.decode(response.body)['id'];

      menuItems.forEach(
        (menuItem) => pushOrderItem(menuItem, id)
      );
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to push order: ' + response.statusCode.toString());
    }
  });
}

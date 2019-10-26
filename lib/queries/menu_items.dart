import 'package:appetite/types/restaurant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Category>> fetchCategories() async {
  final response =
    await http.get("http://dondernemers.be/api/v1/MenuItem/");

  if (response.statusCode == 200) {
    Map categories = json.decode(response.body).fold(
      Map(),
      (acc, item) {
        MenuItem menuItem = MenuItem.fromJson(item);
        String category = item['category']['name'];
        if (acc.keys.contains(category)) {
          acc[category].add(menuItem);
        } else {
          acc[category] = [menuItem];
        }

        return acc;
      }
    );

    return List<Category>.from(categories.entries.map((entry) => Category(entry.value.sort((a, b) => -a.suggested.compareTo(b.suggested)), entry.key)));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load menu items: ' + response.statusCode.toString());
  }
}

import 'package:flutter/material.dart';
import 'package:appetite/util/appbar.dart';
import 'package:appetite/queries/restaurants.dart';
import 'package:appetite/types/restaurant.dart';
import 'package:appetite/widgets/restaurant.dart' as Resto;

class SelectRestaurant extends StatelessWidget {
  final Future<List<Restaurant>> restaurants = fetchRestaurants();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.appBar('Select restaurant', context),
      body: Center(child: Column(
        children: [
          Padding(padding: EdgeInsets.all(30)),
          Text('Please select a restaurant', textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          Padding(padding: EdgeInsets.all(10)),
          Divider(thickness: 4),
          Padding(padding: EdgeInsets.all(10)),
          FutureBuilder<List<Restaurant>>(
            future: restaurants,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data.map((restaurant) {
                    return FlatButton(
                      child: Text(restaurant.name, style: TextStyle(fontSize: 18)),
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Resto.Restaurant(false))); },
                    );
                  }).toList()
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          )
        ]
      ))
    );
  }
}

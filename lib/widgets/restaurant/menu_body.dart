import 'package:flutter/material.dart';
import 'package:appetite/constants.dart';
import 'package:appetite/types/restaurant.dart';
import 'package:appetite/widgets/restaurant.dart';
import 'package:appetite/queries/menu_items.dart';
import 'package:appetite/queries/submit_order.dart';

class MenuBody extends StatefulWidget {
  final RestaurantState restaurantState;

  MenuBody(this.restaurantState);

  MenuBodyState createState() => MenuBodyState(restaurantState);
}

class MenuBodyState extends State<MenuBody> {
  final Future<List<Category>> categories = fetchCategories();
  final RestaurantState restaurantState;

  MenuBodyState(this.restaurantState);

  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: categories,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
              children: snapshot.data.map(
                (category) => CategoryBody(category, this)
              ).fold([], (acc, item) => acc.length > 0 ? acc + [Divider(), item] : [header(snapshot.data), Divider(thickness: 4), item])
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget header(data) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Price', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('€ ' + data.fold(
                  0,
                  (acc, item) =>
                    acc + item.menuItems.fold(0, (acc_, item) => acc_ + item.price * item.count))
                    .toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold)
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          PayNowButton(restaurantState, this, data)
        ],
      ),
      margin: const EdgeInsets.all(20.0)
    );
  }
}

class CategoryBody extends StatelessWidget {
  final Category category;
  final MenuBodyState menuBodyState;

  CategoryBody(this.category, this.menuBodyState);

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            children: [
              Text(category.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          margin: EdgeInsets.only(
              top: 16,
              bottom: 8,
              left: 16
          ),
        ),
        Column(children: category.menuItems.map((menuItem) => MenuItemWidget(menuItem, menuBodyState)).toList())
      ],
    );
  }
}

class PayNowButton extends StatelessWidget {
  final RestaurantState restaurantState;
  final MenuBodyState menuBodyState;

  final data;

  PayNowButton(this.restaurantState, this.menuBodyState, this.data);

  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {

        if (canPay()) {
          pushOrder(List<MenuItem>.from(data.expand((Category category) => category.menuItems.where((MenuItem menuItem) => menuItem.count > 0).map((menuItem) => menuItem.copy()).toList())));

          menuBodyState.setState(() => data.forEach(
                  (category) => category.menuItems.forEach((menuItem) => menuItem.count = 0)
          ));
        }
      },
      child: Text('Pay now', style: TextStyle(color: Colors.white)),
      color: canPay() ? Colors.red : Colors.grey,
    );
  }

  bool canPay() => restaurantState.onSpot || restaurantState.reservationDate != null;
}

class Counter extends StatelessWidget {
  final MenuItemWidgetState menuItemWidgetState;

  Counter(this.menuItemWidgetState);

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30.0,
          child: RaisedButton(
            child: Text('-', textAlign: TextAlign.center),
            onPressed: menuItemWidgetState.countDown,
            color: Color(Constants.kotszakske),
            shape: CircleBorder()
          ),
        ),
        Container(child: Text(menuItemWidgetState.menuItem.count.toString(), textAlign: TextAlign.center), margin: EdgeInsets.only(left: 8, right: 8)),
        SizedBox(
          width: 30.0,
          child: RaisedButton(
            child: Text('+', textAlign: TextAlign.center),
            onPressed: menuItemWidgetState.countUp,
            color: Color(Constants.kotszakske),
            shape: CircleBorder()
          ),
        )
      ],
    );
  }
}

class MenuItemWidget extends StatefulWidget {
  final MenuItem menuItem;
  final MenuBodyState menuBodyState;

  MenuItemWidget(this.menuItem, this.menuBodyState);

  MenuItemWidgetState createState() => MenuItemWidgetState(menuItem, menuBodyState);
}

class MenuItemWidgetState extends State<MenuItemWidget> {
  final MenuItem menuItem;
  final MenuBodyState menuBodyState;

  MenuItemWidgetState(this.menuItem, this.menuBodyState);

  void countUp() {
    menuBodyState.setState(() => menuItem.count++);
  }

  void countDown() {
    menuBodyState.setState(() => menuItem.count = menuItem.count == 0 ? 0 : menuItem.count - 1);
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(menuItem.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('€ ' + menuItem.price.toStringAsFixed(2)),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.55,
              ),
              Counter(this)
            ],
          ),
          Row(
            children: <Widget>[
              Text(menuItem.description, style: TextStyle(fontStyle: FontStyle.italic))
            ],
          ),
        ],
      ),
      margin: const EdgeInsets.all(12.0),
    );
  }
}

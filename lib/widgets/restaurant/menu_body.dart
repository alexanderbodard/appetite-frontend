import 'package:flutter/material.dart';
import 'package:appetite/widgets/constants.dart';
import 'package:appetite/types/restaurant.dart';

class MenuBody extends StatefulWidget {
  MenuBodyState createState() => MenuBodyState();
}

class MenuBodyState extends State<MenuBody> {
  final List<MenuItem> menuItems = MenuItem.mock;

  Widget build(BuildContext context) {
    return ListView(
      children: menuItems.map(
              (menuItem) => MenuItemWidget(menuItem, this)
      ).fold(List(), (acc, item) => acc.length > 0 ? acc + [Divider(), item] : acc + [header(), Divider(thickness: 4),item])
    );
  }

  Widget header() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Price', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('€ ' + menuItems.fold(0, (acc, item) => acc + item.price * item.count).toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          PayNowButton()
        ],
      ),
      margin: const EdgeInsets.all(20.0)
    );
  }
}

class PayNowButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Alert'),
            content: Text('You paid'),
          ),
        );
      },
      child: Text('Pay now'),
      color: Colors.red,
    );
  }
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
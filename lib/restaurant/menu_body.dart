import 'package:flutter/material.dart';
import 'package:appetite/constants.dart';

class MenuBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: MenuItem.mock.map(
          (menuItem) => MenuItemWidget(menuItem)
      ).fold(List(), (acc, item) => acc.length > 0 ? acc + [Divider(), item] : acc + [item])
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
        Container(child: Text(menuItemWidgetState.count.toString(), textAlign: TextAlign.center), margin: EdgeInsets.only(left: 8, right: 8)),
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

  MenuItemWidget(this.menuItem);

  MenuItemWidgetState createState() => MenuItemWidgetState(menuItem);
}

class MenuItemWidgetState extends State<MenuItemWidget> {
  final MenuItem menuItem;
  int count = 0;

  MenuItemWidgetState(this.menuItem);

  void countUp() => setState(() => count++);

  void countDown() => setState(() => count = count == 0 ? 0 : count - 1);

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
                    Text('€ ' + menuItem.price.toString()),
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
      margin: const EdgeInsets.all(20.0),
    );
  }
}

class MenuItem {
  int id;
  double price;
  String name;
  String description;

  MenuItem(this.id, this.price, this.name, this.description);

  static List<MenuItem> get mock {
    return [
      MenuItem(1, 2.05, 'Coca Cola', 'Coca Cola description'),
      MenuItem(2, 1.85, 'Pepsi', 'Coca Cola but worse'),
      MenuItem(3, 1.9, 'Stella', 'Just beer'),
      MenuItem(4, 2.5, 'Heineken', 'Just water'),
      MenuItem(1, 2.05, 'Coca Cola', 'Coca Cola description'),
      MenuItem(2, 1.85, 'Pepsi', 'Coca Cola but worse'),
      MenuItem(3, 1.9, 'Stella', 'Just beer'),
      MenuItem(4, 2.5, 'Heineken', 'Just water'),
      MenuItem(1, 2.05, 'Coca Cola', 'Coca Cola description'),
      MenuItem(2, 1.85, 'Pepsi', 'Coca Cola but worse'),
      MenuItem(3, 1.9, 'Stella', 'Just beer'),
      MenuItem(4, 2.5, 'Heineken', 'Just water'),

    ];
  }
}

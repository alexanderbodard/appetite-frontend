import 'package:flutter/material.dart';
import 'package:appetite/types/restaurant.dart';

class OrdersBody extends StatelessWidget {
  final List<OrderItem> orderItems = OrderItem.mock;

  Widget build(BuildContext context) {
    return ListView(
      children: orderItems.map((orderItem) => OrderItemWidget(orderItem)).toList().fold(
        [TotalOrders(orderItems)],
        (acc, item) => acc.sublist(0, acc.length - 1) + [item, Divider(), acc.removeLast()]
      )
    );
  }
}

class TotalOrders extends StatelessWidget {
  final List<OrderItem> orderItems;

  TotalOrders(this.orderItems);

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
                    Text(''),
                    Text('Total', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.55,
              ),
              Text('€ ' + orderItems.fold(0, (acc, item) => acc + item.count * item.price).toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
      margin: const EdgeInsets.all(12.0),
    );
  }
}

class OrderItemWidget extends StatelessWidget {

  final OrderItem orderItem;

  OrderItemWidget(this.orderItem);

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
                    Text(orderItem.name + (orderItem.count > 1 ? ' x ' + orderItem.count.toString() : ''), style: TextStyle(fontStyle: FontStyle.italic)),
                    Text('€ ' + orderItem.price.toStringAsFixed(2)),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.55,
              ),
              Text('€ ' + (orderItem.price * orderItem.count).toStringAsFixed(2))
            ],
          ),
        ],
      ),
      margin: const EdgeInsets.all(12.0),
    );
  }
}

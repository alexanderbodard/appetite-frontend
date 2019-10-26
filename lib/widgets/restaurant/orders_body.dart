import 'package:flutter/material.dart';
import 'package:appetite/types/restaurant.dart';

class OrdersBody extends StatelessWidget {
  final List<Order> orders = Order.mock;

  Widget build(BuildContext context) {
    return ListView(
      children: orders.map((order) => OrderBody(order)).fold(
        [],
        (acc, item) => acc.length == 0 ? [item] : acc + [
          Padding(padding: EdgeInsets.all(8)),
          Divider(thickness: 4),
          Padding(padding: EdgeInsets.all(8)),
          item
        ]
      )
    );
  }
}

class OrderBody extends StatelessWidget {
  final Order order;

  OrderBody(this.order);

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Text(order.date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          margin: EdgeInsets.only(
            top: 16,
            bottom: 8,
            left: 16
          ),
        ),
        Column(
          children: order.orderItems.map((orderItem) => OrderItemWidget(orderItem)).toList().fold(
            [OrderTotal(order.orderItems)],
            (acc, item) => acc.sublist(0, acc.length - 1) + [item, Divider(), acc.removeLast()]
          )
        ),
      ]
    );
  }
}

class OrderTotal extends StatelessWidget {
  final List<OrderItem> orderItems;

  OrderTotal(this.orderItems);

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

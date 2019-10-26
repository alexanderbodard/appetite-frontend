
class Category {
  List<MenuItem> menuItems;
  String name;

  Category(this.menuItems, this.name);

  static List<Category> get mock {
    return [
      Category(MenuItem.mock.sublist(0, 3), 'Non-Heineken drinks'),
      Category(MenuItem.mock.sublist(3, 4), 'Heineken drinks')
    ];
  }
}

class MenuItem {
  double price;
  String name;
  String description;
  bool suggested;

  int count = 0;

  MenuItem(this.price, this.name, this.description, this.suggested);

  static List<MenuItem> get mock {
    return [
      MenuItem(2.05, 'Coca Cola', 'Coca Cola description', true),
      MenuItem(1.85, 'Pepsi', 'Coca Cola but worse', false),
      MenuItem(1.9, 'Stella', 'Just beer', true),
      MenuItem(2.5, 'Heineken', 'Just water', false),
      MenuItem(2.05, 'Coca Cola', 'Coca Cola description', true),
      MenuItem(1.85, 'Pepsi', 'Coca Cola but worse', false),
      MenuItem(1.9, 'Stella', 'Just beer', true),
      MenuItem(2.5, 'Heineken', 'Just water', false),
      MenuItem(2.05, 'Coca Cola', 'Coca Cola description', true),
      MenuItem(1.85, 'Pepsi', 'Coca Cola but worse', false),
      MenuItem(1.9, 'Stella', 'Just beer', true),
      MenuItem(2.5, 'Heineken', 'Just water', false),
    ];
  }

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      json['price'],
      json['name'],
      json['extra_info'],
      json['suggested'],
    );
  }
}

class Order {
  List<OrderItem> orderItems;
  String date;

  Order(this.orderItems, this.date);

  static List<Order> get mock {
    return [Order(OrderItem.mock, '26-10-2019'), Order(OrderItem.mock, '27-10-2019')];
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      json['orderItems'].map((orderItem) {
        return OrderItem(
          orderItem['price'],
          orderItem['name'],
          orderItem['amount'],
        );
      }),
      json['created_at'].split(' ')[0]
    );
  }
}

class OrderItem {
  double price;
  String name;
  int count;

  OrderItem(this.price, this.name, this.count);

  static List<OrderItem> get mock {
    return [
      OrderItem(2.05, 'Coca Cola', 2),
      OrderItem(1.9, 'Stella', 5),
      OrderItem(2.5, 'Heineken', 1),
    ];
  }
}

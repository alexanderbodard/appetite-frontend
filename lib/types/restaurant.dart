
class MenuItem {
  int id;
  double price;
  String name;
  String description;

  int count = 0;

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

class OrderItem {
  int id;
  double price;
  String name;
  int count;

  OrderItem(this.id, this.price, this.name, this.count);

  static List<OrderItem> get mock {
    return [
      OrderItem(1, 2.05, 'Coca Cola', 2),
      OrderItem(3, 1.9, 'Stella', 5),
      OrderItem(4, 2.5, 'Heineken', 1),
    ];
  }
}

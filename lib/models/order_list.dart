import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';

import 'order.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString() + DateTime.now().toString(),
        amount: cart.totalAmount,
        products: cart.items.values.toList(),
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}

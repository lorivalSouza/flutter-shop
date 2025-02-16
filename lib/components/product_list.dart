import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';

import '../models/product.dart';

class ProductList extends ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}

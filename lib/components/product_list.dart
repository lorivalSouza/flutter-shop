import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';

import '../models/product.dart';

class ProductList extends ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  int get itemsCount {
    return _items.length;
  }
}

//Aplicando o favorites na aplicação toda
/*
bool _showFavoriteOnly = false;

  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((product) => product.isFavorite).toList();
    } else {
      return [..._items];
    }
    // spread operator
  }

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }
*/

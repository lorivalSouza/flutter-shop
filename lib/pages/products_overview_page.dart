import 'package:flutter/material.dart';
import '../components/product_grid.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Overview'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ProductGrid(),
    );
  }
}

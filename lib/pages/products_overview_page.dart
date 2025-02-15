import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/components/product_list.dart';
import 'package:shop/models/product.dart';

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadProducts = provider.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Overview'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, i) => ProductItem(product: loadProducts[i]),
        itemCount: loadProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}

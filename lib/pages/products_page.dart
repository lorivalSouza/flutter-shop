import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_list.dart';

import '../components/app_drawer.dart';
import '../components/product_item.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProductItem(products.items[i]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

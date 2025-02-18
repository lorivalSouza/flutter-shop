import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart_item.dart';

class CartDetailPage extends StatelessWidget {
  final String itemName;
  final int quantity;
  final double price;

  CartDetailPage({
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final CartItem cartItem = Provider.of<CartItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item: $itemName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Quantity: $quantity',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

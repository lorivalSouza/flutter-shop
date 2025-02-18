import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({required this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text(
                  'R\$ ${cartItem.price}', // Replace with actual price
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          title: Text(
            cartItem.name, // Replace with actual product title
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Total: R\$  * cartItem.quantity}', // Replace with actual total price
            style: TextStyle(color: Colors.grey),
          ),
          trailing: Text(
            '${cartItem.quantity} Xx', // Replace with actual quantity
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

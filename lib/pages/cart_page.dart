import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import 'cart_detail_page.dart';

class CartPage extends StatelessWidget {
  // final List<String> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    // cartItems.length = cart.itemCount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: Card(
        margin: EdgeInsets.all(16.0),
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'R\$${cart.totalAmount}', // Replace with actual total calculation
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  //backgroundColor: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  color: Colors.grey[50],
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Provider.value(
                              value: cart.items.values.toList()[index],
                              child: CartDetailPage(
                                itemName:
                                    cart.items.values.toList()[index].name,
                                quantity:
                                    cart.items.values.toList()[index].quantity,
                                price: cart.items.values.toList()[index].price,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    iconColor: Colors.black87,
                    title: Text(
                      '${cart.items.values.toList()[index].name} - ${cart.items.values.toList()[index].quantity} x R\$${cart.items.values.toList()[index].price.toStringAsFixed(2)}',
                      // Accessing the name property of the CartItem
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).primaryColor),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () {
                        cart.clear();
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 18.0),
                backgroundColor: Colors.grey[50],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.payment),
                  SizedBox(width: 8.0),
                  Text('Proceed to Checkout'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

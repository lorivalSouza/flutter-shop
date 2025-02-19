import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart_item.dart';

import '../models/cart.dart';

class CartDetailPage extends StatefulWidget {
  final String itemName;
  final int quantity;
  final double price;

  CartDetailPage({
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  @override
  _CartDetailPageState createState() => _CartDetailPageState();
}

class _CartDetailPageState extends State<CartDetailPage> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final CartItem cartItem = Provider.of<CartItem>(context);
    final Cart cart = Provider.of<Cart>(context);
    double totalPrice = quantity * widget.price;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes dos itens'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item: ${widget.itemName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      cart.decreaseQuantity(cartItem.productId);
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(
                  'Quantidade: $quantity',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    cart.increaseQuantity(cartItem.productId);
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Preço: R\$ ${widget.price.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Spacer(),
            Card(
              margin: EdgeInsets.all(16.0),
              color: Colors.grey[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'R\$ ${totalPrice.toStringAsFixed(2)}', // Replace with actual total calculation
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        //backgroundColor: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

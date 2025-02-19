import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: orders.itemsCount == 0
            ? Text('Nenhum pedido encontrado!')
            : ListView.builder(
                itemCount: orders.itemsCount,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: OrderWidget(order: orders.items[index]),
                  );
                },
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/pages/cart_detail_page.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/order_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/utils/app_routes.dart';

import 'components/product_list.dart';
import 'pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.purple,
          hintColor: Colors.deepOrange,
          secondaryHeaderColor: Colors.amber,
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(error: Colors.red),
        ),
        //home: ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (ctx) => ProductsOverviewPage(),
          AppRoutes.ordersPage: (ctx) => OrderPage(),
          AppRoutes.productDetailPage: (ctx) => ProductDetailPage(),
          AppRoutes.cartPage: (ctx) => CartPage(),
          AppRoutes.cartDetailPage: (ctx) =>
              CartDetailPage(itemName: '', quantity: 1, price: 0.0),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

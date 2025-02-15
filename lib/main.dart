import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (context) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.purple,
          primarySwatch: Colors.blue,
          hintColor: Colors.deepOrange,
          secondaryHeaderColor: Colors.amber,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.productDetailPage: (ctx) => ProductDetailPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

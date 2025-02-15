import 'package:flutter/material.dart';

import 'pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blue,
          primarySwatch: Colors.blue,
          secondaryHeaderColor: Colors.amber),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

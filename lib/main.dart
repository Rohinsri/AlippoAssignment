import 'package:flutter/material.dart';
import 'screens/product_page.dart';
import 'screens/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Cart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Product Cart App'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Products'),
                Tab(text: 'Carts'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ProductListPage(),
              CartPage(),
            ],
          ),
        ),
      ),
    );
  }
}
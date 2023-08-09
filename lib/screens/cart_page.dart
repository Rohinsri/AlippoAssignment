import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/cart.dart';
import '../widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  Future<List<Cart>> fetchCart() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/carts'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['carts'];
      return jsonData.map((cartJson) => Cart.fromJSON(cartJson)).toList();

    } else {
      throw Exception('Failed to load carts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Cart>>(
        future: fetchCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final carts = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: carts.length,
              itemBuilder: (context, index) {
                final cart = carts[index];
                return CartListItem(cart: cart);
              },
            );
          }
        },
      ),
    );
  }
}

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

  int _skip = 0;
  final int _limit = 10;
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  late Future<List<Cart>> _cartsFuture;
  final List<Cart> _carts = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_cartScrollListener);
    _cartsFuture = fetchCarts(_skip,_limit);
  }

  void _cartScrollListener() {
    if (!_isLoading && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        _isLoading = true;
        _skip=_skip+_limit;
        _cartsFuture = fetchCarts(_skip, _limit);
      });
    }
  }

  Future<List<Cart>> fetchCarts(int skip, int limit) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/carts?skip=$skip&page=$limit'));
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
        future: _cartsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final carts = snapshot.data!;
            carts.addAll(_carts);
            _isLoading = false;
            return ListView.builder(
              controller: _scrollController,
              itemCount: carts.length,
              itemBuilder: (context, index) {
                if(index==carts.length){
                  return const Center(child: CircularProgressIndicator());
                }
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

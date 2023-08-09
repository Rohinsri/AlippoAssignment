import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:untitled1/models/products.dart';
import 'package:untitled1/widgets/product_list_item.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  int _skip = 0;
  final int _limit = 10;
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  late Future<List<Product>> _productsFuture;
  final List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_productsScrollListener);
    _productsFuture = fetchProducts(_skip,_limit);
  }

  void _productsScrollListener() {
    if (!_isLoading && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        _isLoading = true;
        _skip=_skip+_limit;
        _productsFuture = fetchProducts(_skip, _limit);
      });
    }
  }

  Future<List<Product>> fetchProducts(int skip, int limit) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products?skip=$skip&page=$limit'));
    if (response.statusCode == 200) {
      final productsData = json.decode(response.body)['products'] as List<dynamic>;
      final List<Product> products = productsData.map((productJson) => Product.fromJSON(productJson)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data!;
            _products.addAll(products);
            _isLoading = false;
            return ListView.builder(
              controller: _scrollController,
              itemCount: _products.length,
              itemBuilder: (context, index) {
                if(index==_products.length){
                  return const Center(child: CircularProgressIndicator());
                }
                final product = _products[index];
                return ProductListItem(product: product);
              },
            );
          }
        },
      ),
    );
  }
}

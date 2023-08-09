import 'package:flutter/material.dart';
import '../models/products.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(product.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(product.description),
              const SizedBox(height: 10),
              Text('Price: \$${product.price.toStringAsFixed(2)}'),
              Text('Discount Percentage: ${product.discountPercentage.toStringAsFixed(2)}'),
              const SizedBox(height: 10),
              Image.network(product.thumbnail),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

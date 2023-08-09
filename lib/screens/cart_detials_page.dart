import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../widgets/cart_product_list_item.dart';

class CartDetailsPage extends StatelessWidget {
  final Cart cart;

  const CartDetailsPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cart ID: ${cart.id}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Cart Total: ${cart.total}"),
              const SizedBox(height: 10),
              Text('Total Products: ${cart.totalProducts}'),
              Text('User ID: ${cart.userId}'),
              const SizedBox(height: 10),
              const Text('Cart Products'),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cart.products.length,
                itemBuilder: (context, index) {
                  final cartProduct = cart.products[index];
                  return CartProductListItem(cartProduct: cartProduct);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

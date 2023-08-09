import 'package:flutter/material.dart';
import '../models/cart_product.dart';

class CartProductListItem extends StatelessWidget {
  final CartProduct cartProduct ;
  const CartProductListItem({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){},
        leading: CircleAvatar(
          child: Text(cartProduct.id.toString()),
        ),
        title: Text(cartProduct.title),
        subtitle: Column(
          children: [
            Text("Quantity: ${cartProduct.quantity}"),
            Text("Price: ${cartProduct.price}"),
            Text("Discounted Price: ${cartProduct.discountedPrice}"),
            Text("Discount Percentage: ${cartProduct.discountPercentage}"),
          ],
        ),
      ),
    );
  }
}

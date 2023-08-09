import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../screens/cart_detials_page.dart';

class CartListItem extends StatelessWidget {
  final Cart cart ;
  const CartListItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CartDetailsPage(cart: cart))
          );
        },
        leading: CircleAvatar(
          child: Text(cart.id.toString()),
        ),
        title: Text("Total:  \$${cart.total}"),
        subtitle: Text("Total Products: ${cart.totalProducts}"),
        trailing: Text("UID: ${cart.userId}"),
      ),
    );
  }
}

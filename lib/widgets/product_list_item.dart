import 'package:flutter/material.dart';
import 'package:untitled1/screens/product_details_page.dart';
import '../models/products.dart';

class ProductListItem extends StatelessWidget {
  final Product product ;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: product))
          );
        },
        leading: Image.network(product.thumbnail),
        title: Text(product.title),
        subtitle: Text(product.description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Rs.${product.price}"),
            Text("Dis. Price ${product.price - (product.price*(product.discountPercentage/100))}"),
          ],
        ),
      ),
    );
  }
}

import 'cart_product.dart';

class Cart {
  final int id;
  final List<CartProduct> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity
  });

  factory Cart.fromJSON(Map<String, dynamic> json) {
    final List<dynamic> jsonData = json['products'];
    final List<CartProduct> products =[];
    for(int i=0;i<jsonData.length;i++){
      products.add(CartProduct.fromJSON(jsonData[i]));
    }
    return Cart(
      id: json['id'],
      products: products,
      discountedTotal: json['discountedTotal'],
      total: json['total'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
      userId: json['userId']
    );
  }
}

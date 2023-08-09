class CartProduct {
  final int id;
  final String title;
  final double price;
  final double discountPercentage;
  final double discountedPrice;
  final int quantity;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.discountedPrice,
    required this.quantity
  });

  factory CartProduct.fromJSON(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      discountedPrice: json['discountedPrice'],
      quantity: json['quantity']
    );
  }
}

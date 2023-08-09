class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  Product({
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.images,
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.thumbnail,
  });

  factory Product.fromJSON(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      thumbnail: json['thumbnail'],
      rating: json['rating'].toDouble(),
      brand: json['brand'],
      category: json['category'],
      images: json['images'].toList(),
      stock: json['stock']
    );
  }
}

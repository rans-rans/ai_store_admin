class Product {
  final int id;
  final String name;
  final String description;
  final int categoryId;
  final int brandId;
  final int quantity;
  final double price;
  final List<String> images;
  final List<dynamic> variants;
  final double discount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.brandId,
    required this.quantity,
    required this.price,
    required this.images,
    required this.variants,
    required this.discount,
  });
}

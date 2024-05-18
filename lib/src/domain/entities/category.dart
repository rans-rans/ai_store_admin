class Category {
  final int id;
  final String name;
  final String imgUrl;

  Category({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'category_id': id,
      'category_name': name,
      'category_image': imgUrl,
    };
  }
}

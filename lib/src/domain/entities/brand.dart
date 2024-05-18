class Brand {
  final int id;
  final String name;
  final String imgUrl;

  Brand({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'brand_id': id,
      'brand_name': name,
      'brand_image': imgUrl,
    };
  }
}

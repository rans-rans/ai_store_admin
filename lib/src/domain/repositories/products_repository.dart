import '../entities/product.dart';

abstract class ProductsRepository {
  Future<Product> addProduct({
    required Map<String, dynamic> productData,
  });
}

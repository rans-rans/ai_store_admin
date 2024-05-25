import 'dart:convert';
import 'dart:io';

import 'package:ai_store_admin/src/domain/entities/product.dart';

import '../../domain/entities/brand.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasource/express_datasource.dart';

class ExpressRepo implements CategoryRepo, ProductsRepository {
  final ExpressDatasource expressDatasource;

  ExpressRepo({
    required this.expressDatasource,
  });

  @override
  Future<Brand> addBrand({
    required String brandName,
    required File imageFile,
  }) async {
    try {
      final brandData = await expressDatasource.addBrand(
        brandName: brandName,
        imageFile: imageFile,
      );
      final brand = Brand(
        id: brandData['brand_id'],
        imgUrl: brandData['image_url'],
        name: brandName,
      );
      return brand;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Category> addCategory({
    required String categoryName,
    required File imageFile,
  }) async {
    try {
      final categoryData = await expressDatasource.addCategory(
        categoryName: categoryName,
        imageFile: imageFile,
      );
      final category = Category(
        id: categoryData['category_id'],
        imgUrl: categoryData['image_url'],
        name: categoryName,
      );
      return category;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Product> addProduct({required Map<String, dynamic> productData}) async {
    try {
      final response = await expressDatasource.addProduct(productData);
      final product = Product(
        id: productData['id'],
        name: productData['name'],
        description: productData['description'],
        categoryId: productData['category_id'],
        brandId: productData['brand_id'],
        quantity: productData['quantity'],
        price: productData['price'],
        images: response['images'],
        variants: json.decode(productData['variants']),
        discount: productData['discount'],
      );
      return product;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Brand>> fetchBrands() async {
    try {
      final request = await expressDatasource.fetchBrands();
      final brands = request
          .map(
            (e) => Brand(
              id: e['id'],
              name: e['name'],
              imgUrl: e['image_url'],
            ),
          )
          .toList();
      return brands;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Category>> fetchCategories() async {
    try {
      final request = await expressDatasource.fetchCategories();
      final categories = request
          .map(
            (e) => Category(
              id: e['id'],
              name: e['name'],
              imgUrl: e['image_url'],
            ),
          )
          .toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}

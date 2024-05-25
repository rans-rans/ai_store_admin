import 'dart:convert';
import 'dart:io';

import '../../../config/constants/api_constants.dart';
import '../../../config/network/network_request.dart';
import 'firebase_datasource.dart';

class ExpressDatasource {
  final FirebaseDatasource firebaseDatasource;

  ExpressDatasource({required this.firebaseDatasource});

  Future<Map<String, dynamic>> addBrand({
    required String brandName,
    required File imageFile,
  }) async {
    try {
      final imageUrl = await firebaseDatasource.uploadImage(imageFile, 'brands');
      final request = await NetworkRequest.post(
        url: "$baseUrl/admin/add-brand",
        body: {
          "brand_name": brandName,
          "brand_img": imageUrl,
        },
      );
      final response = json.decode(request.body) as Map<String, dynamic>;
      return {
        'brand_id': response['brand_id'],
        'image_url': imageUrl,
      };
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addCategory({
    required String categoryName,
    required File imageFile,
  }) async {
    try {
      final imageUrl = await firebaseDatasource.uploadImage(imageFile, 'categories');
      final request = await NetworkRequest.post(
        url: "$baseUrl/admin/add-category",
        body: {
          "category_name": categoryName,
          "category_img": imageUrl,
        },
      );
      final response = json.decode(request.body) as Map<String, dynamic>;
      return {
        'category_id': response['category_id'],
        'image_url': imageUrl,
      };
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addProduct(Map<String, dynamic> productData) async {
    try {
      final productId = productData['id'] as int;
      final imagesPath = productData['images_path'] as List<String>;

      final imageUrls = await firebaseDatasource.uploadImageList(
        imagesPath: imagesPath,
        destination: 'products/$productId',
      );

      final requestData = productData;
      requestData.remove('images_path');
      requestData['images'] = json.encode(imageUrls);

      final request = await NetworkRequest.post(
          url: "$baseUrl/admin/add-product",
          body: json.encode(requestData),
          headers: {
            'content-type': 'application/json',
          });
      return {
        'data': request,
        'images': imageUrls,
      };
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> fetchBrands() async {
    try {
      final request = await NetworkRequest.get(url: "$baseUrl/admin/fetch-brands");
      final brandsData = json.decode(request.body) as List<dynamic>;
      return brandsData;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    try {
      final request =
          await NetworkRequest.get(url: "$baseUrl/admin/fetch-categories");
      final categoriesData = json.decode(request.body) as List<dynamic>;
      return categoriesData;
    } catch (e) {
      rethrow;
    }
  }
}

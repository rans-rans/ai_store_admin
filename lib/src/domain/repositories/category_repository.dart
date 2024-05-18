import 'dart:io';

import '../entities/brand.dart';
import '../entities/category.dart';

abstract class CategoryRepo {
  Future<Brand> addBrand({
    required String brandName,
    required File imageFile,
  });
  Future<Category> addCategory({
    required String categoryName,
    required File imageFile,
  });
  Future<List<Brand>> fetchBrands();
  Future<List<Category>> fetchCategories();
}

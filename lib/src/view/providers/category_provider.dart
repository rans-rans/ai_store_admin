import 'dart:io';

import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryRepo categoryRepo;
  CategoryProvider({required this.categoryRepo});

  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<bool> addCategory({
    required String categoryName,
    required File imageFile,
  }) async {
    try {
      await categoryRepo
          .addCategory(
            categoryName: categoryName,
            imageFile: imageFile,
          )
          .timeout(const Duration(seconds: 15))
          .then((category) {
        _categories.add(category);
        notifyListeners();
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Category>> fetchCategories() async {
    try {
      final categories = await categoryRepo.fetchCategories();
      _categories = categories;
      notifyListeners();
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}

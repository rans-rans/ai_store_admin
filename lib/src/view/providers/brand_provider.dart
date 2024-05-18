import 'dart:io';

import 'package:flutter/material.dart';

import '../../domain/entities/brand.dart';
import '../../domain/repositories/category_repository.dart';

class BrandProvider with ChangeNotifier {
  final CategoryRepo brandRepo;
  BrandProvider({required this.brandRepo});

  List<Brand> _brands = [];

  List<Brand> get brands => _brands;

  Future<bool> addBrand({
    required String brandName,
    required File imageFile,
  }) async {
    try {
      await brandRepo
          .addBrand(
            brandName: brandName,
            imageFile: imageFile,
          )
          .timeout(const Duration(seconds: 15))
          .then((brand) {
        _brands.add(brand);
        notifyListeners();
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Brand>> fetchBrands() async {
    try {
      final brands = await brandRepo.fetchBrands();
      _brands = brands;
      notifyListeners();
      return brands;
    } catch (e) {
      rethrow;
    }
  }
}

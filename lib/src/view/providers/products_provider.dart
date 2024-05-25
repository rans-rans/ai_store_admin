import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsProvider with ChangeNotifier {
  final ProductsRepository productsRepository;

  List<Product> _products = [];

  ProductsProvider({required this.productsRepository});

  List<Product> get products => _products;

  Future<bool> addProduct(Map<String, dynamic> productData) async {
    try {
      await productsRepository.addProduct(productData: productData).then((product) {
        _products.add(product);
        notifyListeners();
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/data/datasource/express_datasource.dart';
import 'src/data/datasource/firebase_datasource.dart';
import 'src/data/repository/express_repo.dart';
import 'src/view/providers/brand_provider.dart';
import 'src/view/providers/category_provider.dart';
import 'src/view/providers/products_provider.dart';

class Injector extends StatelessWidget {
  final Widget child;
  const Injector({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    //datasources
    final firebaseDatasource = FirebaseDatasource();
    final expressDatasource =
        ExpressDatasource(firebaseDatasource: firebaseDatasource);

    //repositories
    final expressRepo = ExpressRepo(expressDatasource: expressDatasource);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BrandProvider(brandRepo: expressRepo),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(categoryRepo: expressRepo),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(productsRepository: expressRepo),
        ),
      ],
      child: child,
    );
  }
}

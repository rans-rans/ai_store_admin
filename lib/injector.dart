import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/data/datasource/express_datasource.dart';
import 'src/data/datasource/firebase_datasource.dart';
import 'src/data/repository/express_repo.dart';
import 'src/view/providers/brand_provider.dart';
import 'src/view/providers/category_provider.dart';

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
    final categoryRepo = ExpressRepo(expressDatasource: expressDatasource);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BrandProvider(brandRepo: categoryRepo),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(categoryRepo: categoryRepo),
        ),
      ],
      child: child,
    );
  }
}

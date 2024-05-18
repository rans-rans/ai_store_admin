import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/category_provider.dart';

class AllCategoryList extends StatelessWidget {
  const AllCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<CategoryProvider>().fetchCategories(),
      child: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
          return ListView.builder(
            itemCount: categoryProvider.categories.length,
            itemBuilder: (context, index) {
              final brand = categoryProvider.categories[index];
              return ListTile(
                title: Text(brand.name),
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(brand.imgUrl),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

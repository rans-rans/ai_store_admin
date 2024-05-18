import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/brand_provider.dart';

class BrandsList extends StatefulWidget {
  const BrandsList({
    super.key,
  });

  @override
  State<BrandsList> createState() => _BrandsListState();
}

class _BrandsListState extends State<BrandsList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<BrandProvider>().fetchBrands(),
      child: Consumer<BrandProvider>(
        builder: (context, brandProvider, child) {
          return ListView.builder(
            itemCount: brandProvider.brands.length,
            itemBuilder: (context, index) {
              final brand = brandProvider.brands[index];
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

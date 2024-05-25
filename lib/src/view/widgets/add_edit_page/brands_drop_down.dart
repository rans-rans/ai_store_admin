import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/brand_provider.dart';

class BrandsDropDown extends StatelessWidget {
  final Function(int) onBrandSelected;
  const BrandsDropDown({
    super.key,
    required this.onBrandSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select  brand*"),
        Consumer<BrandProvider>(
          builder: (context, brandProvider, child) {
            final brands = brandProvider.brands;
            if (brands.isEmpty) {
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: () {
                  brandProvider.fetchBrands();
                },
                child: const Text(
                  "Load brands",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            }
            return DropdownMenu(
              hintText: "Select Brand",
              dropdownMenuEntries: [
                for (var brand in brands)
                  DropdownMenuEntry(
                    value: brand.id,
                    label: brand.name,
                  ),
              ],
              onSelected: (value) {
                onBrandSelected(value!);
              },
            );
          },
        ),
      ],
    );
  }
}

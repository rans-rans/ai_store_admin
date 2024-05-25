import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/category_provider.dart';

class CategoriesDropDown extends StatelessWidget {
  final Function(int) onCategorySelected;
  const CategoriesDropDown({
    super.key,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select category*"),
        Consumer<CategoryProvider>(
          builder: (context, categoryProvider, child) {
            final brands = categoryProvider.categories;
            if (brands.isEmpty) {
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: () {
                  categoryProvider.fetchCategories();
                },
                child: const Text(
                  "Load categories",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            }
            return DropdownMenu(
              hintText: "Select category*",
              dropdownMenuEntries: [
                for (var brand in brands)
                  DropdownMenuEntry(
                    value: brand.id,
                    label: brand.name,
                  ),
              ],
              onSelected: (value) {
                onCategorySelected(value!);
              },
            );
          },
        ),
      ],
    );
  }
}

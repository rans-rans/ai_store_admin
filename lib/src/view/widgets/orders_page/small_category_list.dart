import 'package:flutter/material.dart';

import '../../pages/all_categories_page.dart';

class SmallCategoryList extends StatelessWidget {
  final String title;
  final Widget child;
  const SmallCategoryList({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AllCategoriesPage(),
                  ),
                );
              },
              child: Text(
                "View all",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.11,
          child: child,
        ),
      ],
    );
  }
}

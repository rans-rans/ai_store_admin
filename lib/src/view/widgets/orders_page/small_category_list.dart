import 'package:flutter/material.dart';

import '../../pages/all_categories_page.dart';

class SmallCategoryList extends StatelessWidget {
  final String title;
  const SmallCategoryList({super.key, required this.title});

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
                //TODO view all brands/categories
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AllCategoriesPage()),
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 13,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    //TODO  goto brands/category details screen
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: const Icon(Icons.book),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      //TODO name of brand over here
                      Text(
                        '$title ${index + 1}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/all_categories_page/brands_list.dart';
import '../widgets/all_categories_page/all_category_list.dart';
import 'add_category_page.dart';

class AllCategoriesPage extends StatefulWidget {
  const AllCategoriesPage({super.key});

  @override
  State<AllCategoriesPage> createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  final tabLabels = [
    const Text("Brands"),
    const Text("Categories"),
  ];

  final tabBarView = const TabBarView(
    children: [
      BrandsList(),
      AllCategoryList(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: tabBarView,
        appBar: AppBar(
          title: const Text("Groups"),
          bottom: TabBar(
            tabs: tabLabels,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
          ),
          actions: [
            IconButton(
              onPressed: () {
                //TODO add new brand/category
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddCategoryPage()),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

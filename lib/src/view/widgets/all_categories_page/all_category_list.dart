import 'package:flutter/material.dart';

class AllCategoryList extends StatelessWidget {
  const AllCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 9,
      //TODO list of brands here
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Category  ${index + 1}"),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 9,
      //TODO list of brands here
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Brand  ${index + 1}"),
        );
      },
    );
  }
}

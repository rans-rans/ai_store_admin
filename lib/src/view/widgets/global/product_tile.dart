import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screenSize.height * 0.1,
          width: screenSize.width * 0.35,
          child: const Placeholder(),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO product name here
            Text(
              "Formatics notebook",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            //TODO product-id comes here
            Text(
              "ID #00000034",
              style: TextStyle(color: Colors.grey),
            ),
            //TODO item price comes here
            Text(
              "₵5.50",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sold"),
            Text(
              "67",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

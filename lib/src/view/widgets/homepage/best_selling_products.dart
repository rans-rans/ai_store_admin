import 'package:flutter/material.dart';

class BestSellingProducts extends StatelessWidget {
  const BestSellingProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      height: screenSize.height * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Best selling this week",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                          Text(
                            "Formatics notebook",
                            style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          //TODO product-id comes here
                          Text(
                            "ID #00000034",
                            style: TextStyle(color: Colors.grey),
                          ),
                          //TODO item price comes here
                          Text(
                            "₵5.50",
                            style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                            style:
                                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

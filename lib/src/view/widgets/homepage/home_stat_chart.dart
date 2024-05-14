import 'package:flutter/material.dart';

class HomeStatChart extends StatelessWidget {
  const HomeStatChart({
    super.key,
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
            const Text(
              "Statistics report",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            TextButton(
              //TODO navigate to statistics
              onPressed: () {},
              child: Text(
                'View all',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.25,
          child: const Placeholder(
            child: Center(
              child: Text("Basic graph over here"),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TodayInfoCard extends StatelessWidget {
  const TodayInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * 0.1,
      width: screenSize.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's income",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            //TODO today's income comes here
            Text(
              "₵ 2,244.50",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

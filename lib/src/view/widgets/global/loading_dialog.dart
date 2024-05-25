import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: screenSize.height * 0.55,
        width: screenSize.width * 0.9,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text("Loading"),
          ],
        ),
      ),
    );
  }
}

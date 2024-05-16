import 'package:flutter/material.dart';

import 'config/constants/colors.dart';
import 'src/view/pages/home_controller_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeControllerPage(),
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final itemName = TextEditingController();
  final brand = TextEditingController();
  final itemPrice = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  final subcategory = TextEditingController();
  final images = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ADMIN")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: itemName,
              decoration: const InputDecoration(
                hintText: "item name",
              ),
            ),
            TextField(
              controller: itemPrice,
              decoration: const InputDecoration(
                hintText: "item price",
              ),
            ),
            TextField(
              controller: description,
              decoration: const InputDecoration(
                hintText: "Description",
              ),
            ),
            TextField(
              controller: brand,
              decoration: const InputDecoration(
                hintText: "Brand",
              ),
            ),
            TextField(
              controller: category,
              decoration: const InputDecoration(
                hintText: "item category",
              ),
            ),
            TextField(
              controller: subcategory,
              decoration: const InputDecoration(
                hintText: "sbu category",
              ),
            ),
            TextField(
              controller: images,
              decoration: const InputDecoration(
                hintText: "images",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

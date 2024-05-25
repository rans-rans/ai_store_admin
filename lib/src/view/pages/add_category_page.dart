import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/brand_provider.dart';
import '../providers/category_provider.dart';
import '../widgets/global/loading_dialog.dart';
import '../widgets/global/selected_image_button.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final nameCtrl = TextEditingController();
  final imgCtrl = TextEditingController();

  String? imageFile;

  bool isBrand = true;

  bool validateForm() {
    if (imageFile == null || nameCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Check name or pick image")),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New"),
        actions: [
          OutlinedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
            ),
            onPressed: () async {
              if (!validateForm()) return;
              final name = nameCtrl.text;
              final image = File(imageFile!);
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => const LoadingDialog(),
              );
              bool success = false;
              try {
                if (isBrand) {
                  success = await context.read<BrandProvider>().addBrand(
                        brandName: name,
                        imageFile: image,
                      );
                } else {
                  success = await context.read<CategoryProvider>().addCategory(
                        categoryName: name,
                        imageFile: image,
                      );
                }
              } finally {
                if (mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(success
                            ? "Action completed successfully"
                            : "Action  failed. Try again")),
                  );
                  if (success) {
                    Navigator.pop(context);
                  }
                }
              }
            },
            child: const Text(
              "Done",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        fillColor: const MaterialStatePropertyAll(
                          Colors.black,
                        ),
                        groupValue: isBrand,
                        onChanged: (value) {
                          isBrand = value ?? true;
                          setState(() {});
                        },
                      ),
                      const Text("Brand")
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        fillColor: const MaterialStatePropertyAll(
                          Colors.black,
                        ),
                        groupValue: isBrand,
                        onChanged: (value) {
                          isBrand = value ?? true;
                          setState(() {});
                        },
                      ),
                      const Text("Category")
                    ],
                  ),
                ],
              ),
              TextField(
                controller: nameCtrl,
                cursorColor: Theme.of(context).primaryColor,
                decoration: const InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              if (imageFile != null)
                SizedBox(
                  child: Image.file(
                    File(imageFile!),
                    height: screenSize.height * 0.45,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              SelectImageButton(
                onImageSelected: (image) {
                  if (image != null && mounted) {
                    setState(() {
                      imageFile = image;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

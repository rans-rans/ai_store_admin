import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/add_edit_page/brands_drop_down.dart';
import '../widgets/add_edit_page/categories_drop_down.dart';
import '../widgets/add_edit_page/variant_input.dart';
import '../widgets/global/loading_dialog.dart';
import '../widgets/global/selected_image_button.dart';

class AddEditProductScreen extends StatefulWidget {
  const AddEditProductScreen({super.key});

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final formKey = GlobalKey<FormState>();

  int? selectedBrandId;
  int? selectedCategoryId;

  final descriptionCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final qtyCtrl = TextEditingController();

  List<String> variants = [];
  List<String> selectedImages = [];

  bool formValid() {
    formKey.currentState!.validate();
    final inputValid = formKey.currentState!.validate();
    if (!inputValid) return false;
    if (selectedBrandId == null || selectedCategoryId == null) return false;
    return true;
  }

  void addProduct() async {
    if (!formValid()) return;

    final productName = nameCtrl.text.trim();
    final description = descriptionCtrl.text.trim();
    final price = double.parse(priceCtrl.text.trim());
    final quantity = int.parse(qtyCtrl.text.trim());

    final productId = DateTime.now().millisecondsSinceEpoch;

    final product = {
      'id': productId,
      'name': productName,
      'description': description,
      'category_id': selectedCategoryId,
      'brand_id': selectedBrandId,
      'quantity': quantity,
      'price': price,
      'images_path': selectedImages,
      'variants': json.encode(variants),
      'discount': 0.0,
    };

    bool isComplete = false;

    try {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => const LoadingDialog(),
      );
      isComplete = await context.read<ProductsProvider>().addProduct(product);
    } finally {
      if (mounted) {
        //this pop will remove the loading dialog
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(switch (isComplete) {
              true => "Product added successfully",
              false => "Action failed. Try again",
            }),
          ),
        );
        if (isComplete == true) {
          Navigator.pop(context);
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    descriptionCtrl.dispose();
    nameCtrl.dispose();
    priceCtrl.dispose();
    qtyCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add product"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          ElevatedButton(
            onPressed: addProduct,
            child: const Text("Save"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Product name*'),
                TextFormField(
                  controller: nameCtrl,
                  validator: (value) {
                    if (value == null) return "Enter valid name";
                    if (value.isEmpty) return "Name cannot be empty";
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                const Text('Product Description'),
                SizedBox(
                  height: screenSize.height * 0.2,
                  child: TextFormField(
                    controller: descriptionCtrl,
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: null,
                    minLines: null,
                    expands: true,
                    maxLength: 650,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Enter description";
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: CategoriesDropDown(
                        onCategorySelected: (categoryId) {
                          selectedCategoryId = categoryId;
                        },
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: BrandsDropDown(
                        onBrandSelected: (brandId) {
                          selectedBrandId = brandId;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Qty*"),
                        SizedBox(
                          width: screenSize.width * 0.35,
                          child: TextFormField(
                            controller: qtyCtrl,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              if (int.tryParse(value) == null ||
                                  int.parse(value) <= 0) {
                                return "Enter valid quantity";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Price*"),
                        SizedBox(
                          width: screenSize.width * 0.45,
                          child: TextFormField(
                            controller: priceCtrl,
                            textAlign: TextAlign.right,
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              if (double.tryParse(value) == null ||
                                  double.parse(value) <= 0) {
                                return "Enter valid price";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                StatefulBuilder(builder: (context, snap) {
                  return Container(
                    height: screenSize.height * 0.45,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: selectedImages.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final image = selectedImages[index];
                              return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8.0),
                                height: screenSize.height * 0.2,
                                width: screenSize.width * 0.8,
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Image.file(
                                      File(image),
                                      height: screenSize.height * 0.45,
                                      fit: BoxFit.cover,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        selectedImages.removeWhere(
                                            (element) => element == image);
                                        snap(() {});
                                      },
                                      icon: const Icon(Icons.cancel),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SelectImageButton(
                          onImageSelected: (image) {
                            if (image != null) {
                              selectedImages.add(image);
                              snap(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 25),
                //you add variants over here
                Column(
                  children: [
                    const Text('Add variants'),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey.shade100,
                            height: screenSize.height * 0.05,
                            child: SingleChildScrollView(
                              child: Row(
                                children: [
                                  for (var variant in variants)
                                    Chip(
                                      label: Text(variant),
                                      deleteIcon: const Icon(Icons.cancel),
                                      onDeleted: () {
                                        variants.removeWhere(
                                            (element) => element == variant);
                                        setState(() {});
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final input = await showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const VariantInput();
                              },
                            );
                            if (input == null) return;
                            variants.add(input);
                            setState(() {});
                          },
                          child: const Text("Add"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

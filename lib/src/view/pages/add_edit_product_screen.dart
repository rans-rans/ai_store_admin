import 'package:flutter/material.dart';

import '../widgets/add_edit_page/variant_input.dart';

class AddEditProductScreen extends StatefulWidget {
  const AddEditProductScreen({super.key});

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final formKey = GlobalKey<FormState>();

  final descriptionCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final qtyCtrl = TextEditingController();
  // final nameCtrl = TextEditingController();
  // final nameCtrl = TextEditingController();

  List<String> variants = [];

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
            onPressed: () {
              //TODO  save product here
            },
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
                ),
                const SizedBox(height: 25),
                const Text('Product Description'),
                SizedBox(
                  height: screenSize.height * 0.25,
                  child: TextField(
                    controller: descriptionCtrl,
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: null,
                    minLines: null,
                    expands: true,
                    maxLength: 150,
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select  category"),
                        DropdownMenu(
                          dropdownMenuEntries: [
                            //TODO  list of categories here
                            DropdownMenuEntry(value: '1', label: 'Category 1'),
                            DropdownMenuEntry(value: '1', label: 'Category 2'),
                            DropdownMenuEntry(value: '1', label: 'Category 3'),
                            DropdownMenuEntry(value: '1', label: 'Category 4'),
                            DropdownMenuEntry(value: '1', label: 'Category 5'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select  brand"),
                        DropdownMenu(
                          dropdownMenuEntries: [
                            //TODO  list of brands here
                            DropdownMenuEntry(value: '1', label: 'Brand 1'),
                            DropdownMenuEntry(value: '1', label: 'Brand 2'),
                            DropdownMenuEntry(value: '1', label: 'Brand 3'),
                            DropdownMenuEntry(value: '1', label: 'Brand 4'),
                            DropdownMenuEntry(value: '1', label: 'Brand 5'),
                          ],
                        ),
                      ],
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
                        const Text("Qty"),
                        SizedBox(
                          width: screenSize.width * 0.35,
                          child: TextFormField(
                            controller: qtyCtrl,
                            textAlign: TextAlign.right,
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: true,
                            ),
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                //TODO list of product images are here
                Container(
                  height: screenSize.height * 0.45,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 7,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(8.0),
                              height: screenSize.height * 0.05,
                              width: screenSize.height * 0.2,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  const Placeholder(),
                                  IconButton(
                                    onPressed: () {
                                      //TODO  remove image from list
                                    },
                                    icon: const Icon(Icons.cancel),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Select from gallery"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Pick picture"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                //you add variants over here
                Column(
                  children: [
                    const Text('Add variants'),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: screenSize.height * 0.05,
                            color: Theme.of(context).primaryColor.withAlpha(45),
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

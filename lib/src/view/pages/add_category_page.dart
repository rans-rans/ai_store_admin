import 'package:flutter/material.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final nameCtrl = TextEditingController();
  final imgCtrl = TextEditingController();

  bool isBrand = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New"),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Done"),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: true,
                    fillColor:
                        MaterialStatePropertyAll(Theme.of(context).primaryColor),
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
                    fillColor:
                        MaterialStatePropertyAll(Theme.of(context).primaryColor),
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
            decoration: const InputDecoration(labelText: "Name"),
          ),
          //TODO  selected image comes here
          const SizedBox(),
          ElevatedButton(
            onPressed: () {
              //TODO  image-context.select function here
            },
            child: const Text("Select image"),
          )
        ],
      ),
    );
  }
}

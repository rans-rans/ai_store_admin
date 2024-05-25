import 'package:flutter/material.dart';

class VariantInput extends StatefulWidget {
  const VariantInput({
    super.key,
  });

  @override
  State<VariantInput> createState() => _VariantInputState();
}

class _VariantInputState extends State<VariantInput> {
  final variantCtrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    variantCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: variantCtrl,
                decoration: const InputDecoration(hintText: "Enter a variant"),
              ),
              ElevatedButton(
                child: const Text('DONE'),
                onPressed: () {
                  if (variantCtrl.text.isEmpty) return Navigator.pop(context);
                  return Navigator.pop(context, variantCtrl.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

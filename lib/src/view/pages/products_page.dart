import 'package:flutter/material.dart';

import '../widgets/global/product_tile.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          //TODO  search for products here
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          //TODO  sort the listed products here
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      //TODO list of products here
      body: ListView.builder(
        itemCount: 23,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductTile(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Remaining:"),
                    const Text(" 21pieces"),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        //TODO handle product deletion here
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

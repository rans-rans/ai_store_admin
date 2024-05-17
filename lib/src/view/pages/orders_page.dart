import 'package:flutter/material.dart';

import '../widgets/orders_page/small_category_list.dart';
import '../widgets/orders_page/orders_list.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO  grid of brands listed here
              SmallCategoryList(title: "Brands"),
              SizedBox(height: 15),
              //TODO  grid of brands listed here
              SmallCategoryList(title: "Categories"),
              SizedBox(height: 25),
              Text(
                "Pending Orders",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              //outstanding orders come here
              OrdersList(),
            ],
          ),
        ),
      ),
    );
  }
}

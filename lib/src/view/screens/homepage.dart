import 'package:flutter/material.dart';

import '../widgets/homepage/best_selling_products.dart';
import '../widgets/homepage/home_stat_chart.dart';
import '../widgets/homepage/best_products_list.dart';
import '../widgets/homepage/today_info_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            //TODO goto notifications page
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          )
        ],
        title: const Text(
          'Welcome to Express',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO goto add-product page
        },
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: "Add product",
        child: const Icon(Icons.add),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //show today's order and sales amount info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TodayInfoCard(),
                  TodayInfoCard(),
                ],
              ),
              //home statistics comes here
              HomeStatChart(),
              //best product ratings come here
              SizedBox(height: 24),
              BestProductsList(),
              //top selling products come here
              SizedBox(height: 24),
              BestSellingProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

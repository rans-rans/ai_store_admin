import 'package:flutter/material.dart';

import 'homepage.dart';
import 'orders_page.dart';
import 'statistics_page.dart';

class HomeControllerPage extends StatefulWidget {
  const HomeControllerPage({super.key});

  @override
  State<HomeControllerPage> createState() => _HomeControllerPageState();
}

class _HomeControllerPageState extends State<HomeControllerPage> {
  int selectedBottomNavItem = 0;

  final bottomNavPages = [
    const Homepage(),
    const ProductsPage(),
    const Center(child: Text('Products')),
    const StatisticsPage(),
  ];
  final bottomNavDestinations = const [
    NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    NavigationDestination(icon: Icon(Icons.shopping_bag), label: "Orders"),
    NavigationDestination(icon: Icon(Icons.inventory), label: "Products"),
    NavigationDestination(icon: Icon(Icons.bar_chart), label: "Stats"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedBottomNavItem,
        children: bottomNavPages,
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.white,
        destinations: bottomNavDestinations,
        selectedIndex: selectedBottomNavItem,
        indicatorColor: Theme.of(context).primaryColor,
        onDestinationSelected: (value) {
          setState(() {
            selectedBottomNavItem = value;
          });
        },
      ),
    );
  }
}

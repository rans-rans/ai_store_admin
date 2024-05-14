import 'package:flutter/material.dart';

import 'homepage.dart';

class HomeControllerPage extends StatefulWidget {
  const HomeControllerPage({super.key});

  @override
  State<HomeControllerPage> createState() => _HomeControllerPageState();
}

class _HomeControllerPageState extends State<HomeControllerPage> {
  int selectedBottomNavItem = 0;

  final bottomNavPages = [
    const Homepage(),
    const Center(child: Text('Products')),
    const Center(child: Text('Statistics')),
    const Center(child: Text('Profile')),
  ];
  final bottomNavDestinations = const [
    NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    NavigationDestination(icon: Icon(Icons.shopping_bag), label: "Products"),
    NavigationDestination(icon: Icon(Icons.bar_chart), label: "Stats"),
    NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedBottomNavItem,
        children: bottomNavPages,
      ),
      bottomNavigationBar: NavigationBar(
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

import 'package:coffee_shop/screen/shop_screen.dart';
import 'package:coffee_shop/widget/nav_bar.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void navBarTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List screen = const [
    ShopScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedIndex],
      bottomNavigationBar: CusNavBar(
        onTabChange: navBarTap,
        selectedIndex: selectedIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CusNavBar extends StatelessWidget {
  const CusNavBar(
      {super.key, required this.onTabChange, required this.selectedIndex});

  final void Function(int)? onTabChange;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GNav(
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        color: Colors.brown[800],
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.brown.shade100,
        tabBorderRadius: 24,
        // tabActiveBorder: Border.all(color: Colors.brown),
        tabs: [
          GButton(
            iconSize: 28,
            iconActiveColor: Colors.brown,
            icon: Icons.home_rounded,
            iconColor: Colors.brown[200],
          ),
          GButton(
            iconSize: 28,
            icon: Icons.shopping_bag_outlined,
            iconActiveColor: Colors.brown,
            iconColor: Colors.brown[200],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

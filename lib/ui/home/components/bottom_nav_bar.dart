import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: selectedIndex == 0
                ? primaryColor
                : Colors.grey[400], // Warna Home tergantung kondisi
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: selectedIndex == 1
                ? primaryColor
                : Colors.grey[400], // Warna Wishlist tergantung kondisi
          ),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: selectedIndex == 2
                ? primaryColor
                : Colors.grey[400], // Warna Settings tergantung kondisi
          ),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: selectedIndex == 3
                ? primaryColor
                : Colors.grey[400], // Warna Profile tergantung kondisi
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor, // Warna untuk ikon yang dipilih
      onTap: onItemTapped,
    );
  }
}

import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Adidas",
    "Nike",
    "Puma",
    "Converse",
    "Reebok",
    "Skechers"
  ];
  // untuk ngasih tau selected index biar dia start dari 0
  int selectedIndex = 0;

  @override
  // context: argumen/parameter yg ambil buildcontext
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultpadding),
      // builder:untuk bangun data, untuk nge build UI nya
      child: SizedBox(
        height: 25,
        // biar list nya bisa di scroll secara horizontal
        child: ListView.builder(
            // scrollDirection: mengatur arah scroll
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            // menampung atau membangun data yang akan ditampilkan di UI Screen
            itemBuilder: (context, index) => _buildCategory(index)),
      ),
    );
  }

  // mendeteksi gesture tergantung sama device nya
  GestureDetector _buildCategory(int index) {
    return GestureDetector(
      //inisialisasi ketika mau ada perubahan state
      onTap: () {
        setState(() {
          // buat ngasih tau biar dimulai dari 0
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
        child: Column(
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      selectedIndex == index ? primaryColor : secondaryColor),
            ),
            Container(
              margin: const EdgeInsets.only(top: defaultpadding / 8),
              height: 2,
              width: 30,
              color: selectedIndex == index ? primaryColor : secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}

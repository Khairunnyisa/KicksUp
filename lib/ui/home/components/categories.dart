import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

  List<String> svgPicture = [
    "assets/images/adidas.svg",
    "assets/images/nike.svg",
    "assets/images/puma.svg",
    "assets/images/converse.svg",
    "assets/images/reebok.svg",
    "assets/images/skechers.svg",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultpadding),
      child: SizedBox(
        height: 100, // adjust height to accommodate the circle and text
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => _buildCategory(index)),
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // Lingkaran yang membungkus icon brand
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == index
                    ? primaryColor.withOpacity(0.2) // warna jika terpilih
                    : Colors.grey.withOpacity(0.1), // warna default
              ),
              child: SizedBox(
                width: 30, // ukuran lingkaran lebih besar
                height: 30,
                child: SvgPicture.asset(
                  svgPicture[index],
                  color: selectedIndex == index ? primaryColor : Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 8), // Memberikan jarak antara icon dan text
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      selectedIndex == index ? primaryColor : secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

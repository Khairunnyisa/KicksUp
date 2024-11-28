import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/header.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:e_commerce/ui/home/components/pay.dart';
import 'package:e_commerce/ui/home/components/search.dart';
import 'package:e_commerce/ui/profile/profile_screen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  // List of header images and texts
  final List<Map<String, String>> headerImages = [
    {"image": "assets/images/header_1.png"},
    {"image": "assets/images/header_2.png"},
    {"image": "assets/images/header_3.png"},
  ];

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const CatalogueScreen(), // Home
    const WishlistScreen(), // Wishlist
    // SettingsScreen(isDarkTheme: isDarkTheme, onThemeChanged: onThemeChanged)
    const SettingsScreen(), // Settings
    const ProfileScreen(), // Profile
  ];

  // function untuk aksi tap pada bottom navbar
  void _onItemTapped(int index) {
    setState(() {
      // menyatakan bahwa initial action adalah untuk menampilkan objek yang berada pada index ke-0
      // index yg muncul pertama ada index 0
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Ambil warna teks yang sesuai dengan mode tema
    final textColor = themeProvider.isDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      appBar: _selectedIndex == 0
          ? CustomAppBar(
              onSearchPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              onCartPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ));
              },
            )
          : null,
      // kalau semisalkan selectedindex ini 0, maka akan nampilin catalogue
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pay
                  const Pay(),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: defaultpadding,
                      right: defaultpadding,
                      left: defaultpadding,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Brand",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textColor),
                        ),
                        const Spacer(),
                        const InkWell(
                          child: Text(
                            'Lihat Semua',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Categories(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Bagian kiri: Teks dan Timer
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Today's Offer",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text(
                                    "08:49:17", // Timer statis
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Bagian kanan: Teks "Lihat Semua"
                        const InkWell(
                          child: Text(
                            'Lihat Semua',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // PageView for Header Images
                  Header(headerImages: headerImages),
                  // Bagian GridView
                  Padding(
                    padding: const EdgeInsets.only(
                        right: defaultpadding,
                        left: defaultpadding,
                        bottom: defaultpadding),
                    child: Text(
                      "Hot Product",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultpadding),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: defaultpadding,
                        crossAxisSpacing: defaultpadding,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: product.length,
                      itemBuilder: (context, index) => ItemCard(
                        product: product[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(product: product[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : _widgetOptions[_selectedIndex],

      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

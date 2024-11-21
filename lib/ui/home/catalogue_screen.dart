import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:e_commerce/ui/profile/profile_screen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/profile_img.png"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Hi, Nisa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ));
                  },
                  icon: const Icon(Icons.shopping_cart_checkout_outlined),
                ),
              ],
            )
          : null,
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: defaultpadding,
                        right: defaultpadding,
                        left: defaultpadding),
                    child: Text(
                      "Special Offers🔥",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  // PageView for Header Images
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultpadding),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                        itemCount: headerImages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                headerImages[index]['image']!,
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 5,
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
                              color: Colors.black),
                        ),
                        Spacer(),
                        InkWell(
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
                  // Bagian GridView
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

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ['Sport', 'Female', 'Male'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:e_commerce/ui/profile/profile_screen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/wishlist/component_wishlist/item_card_wishlist.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
      // kita pake multiprovider kalau kita pake lebih dari 1 provider dan dibentuk secara list
      MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const FloShop()));
}

class FloShop extends StatefulWidget {
  const FloShop({super.key});

  @override
  State<FloShop> createState() => _FloShopState();
}

class _FloShopState extends State<FloShop> {
  // an  process
  // use for theme changing process

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // untuk namain app nya
          title: 'FloShop',
          theme: ThemeData(
              brightness: themeProvider.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
              scaffoldBackgroundColor:
                  themeProvider.isDarkTheme ? Colors.black : Colors.white,
              fontFamily: 'Airbnb Cereal',
              // untuk responsive
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: textColor),
                bodySmall: TextStyle(color: textColor),
              )),
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/register': (context) => RegisterScreen(),
            '/home': (context) => const CatalogueScreen(),
            '/wishlist': (context) => const WishlistScreen(),
            '/settings': (context) => SettingsScreen(),
            '/profile': (context) => const CatalogueScreen(),
            '/cart': (context) => const CartScreen(),
          },
        );
      },
    );
  }
}

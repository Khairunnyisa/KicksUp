import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FloShop());
}

class FloShop extends StatelessWidget {
  const FloShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // untuk namain app nya
      title: 'FloShop',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Muli',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: textColor),
            bodySmall: TextStyle(color: textColor),
          )),
      home: const SplashScreen(),
    );
  }
}

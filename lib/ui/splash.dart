import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  void navigator() async {
    await Future.delayed(const Duration(seconds: 3), () {});

    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this, // Menggunakan SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.forward();
    navigator();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Ganti FlutterLogo dengan gambar
              Image.asset(
                'assets/images/kick-logo.png', // Path gambar Anda
                width: 100, // Sesuaikan ukuran gambar
              ),
              const SizedBox(height: 10),
              const Text(
                "KicksUp", // Sesuaikan teksnya
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

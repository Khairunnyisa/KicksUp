import 'package:e_commerce/consts.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    // required: mandatory
    super.key,
    required this.text,
    required this.image,
  });
  // kita mau bikin bisa di swipe
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // spacer: ngasih jarak gap antar widget
        const Spacer(),
        Text(
          "KicksUp",
          style: TextStyle(
              color: primaryColor,
              fontSize: getProportionateScrenWidth(36.0),
              fontWeight: FontWeight.bold),
        ),
        // harus pake Image.asset biar bisa
        Image.asset(
          image,
          height: 350,
          width: 350,
          fit: BoxFit.contain,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.grey, fontSize: getProportionateScrenWidth(18)),
          // untuk membuat rata tengah
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

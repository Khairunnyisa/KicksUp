import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    // required: mandatory
    super.key,
    required this.text,
    required this.image,
    required this.description,
  });
  // kita mau bikin bisa di swipe
  final String text, image, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // spacer: ngasih jarak gap antar widget
        const Spacer(),

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
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScrenWidth(23),
          ),
          // untuk membuat rata tengah
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),

        SizedBox(
          width: 300, // Sesuaikan dengan lebar maksimal yang diinginkan
          child: Text(
            description,
            style: TextStyle(
              color: Colors.grey,
              fontSize: getProportionateScrenWidth(18),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

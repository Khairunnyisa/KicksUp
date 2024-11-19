import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Definisi ukuran proposional gambar sebagai variable const
    const double imageWidthRatio = 0.55; // 60% dari lebar layar
    const double imageheigthRatio = 0.30; // 28% dari tinggi layar

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns text to the start
        children: [
          // Membungkus Text dengan Container berwarna untuk melihat ukuran yang diambil
          const Text(
            "Leather Hand Bag", // Static title
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          Text(
            product.title, // Dynamic product title
            style: const TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      product.getFormattedPrice(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  width: size.width *
                      imageWidthRatio, // Gunakan ratio untuk lebar gambar
                  height: size.height *
                      imageheigthRatio, // Gunakan ratio untuk tinggi gambar
                  fit: BoxFit.contain, // Ensure proper scaling
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

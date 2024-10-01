import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultpadding),
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)),
              child:
                  //efek transisi ke detail page
                  Hero(tag: "${product.id}", child: Image.asset(product.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultpadding),
            child: Text(
              product.title,
              style: const TextStyle(color: textColor),
            ),
          ),
          Text("Rp ${product.price}")
        ],
      ),
    );
  }
}

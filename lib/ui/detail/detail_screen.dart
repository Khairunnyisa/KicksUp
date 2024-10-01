import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/components/add_to_cart.dart';
import 'package:e_commerce/ui/detail/components/cart_counter.dart';
import 'package:e_commerce/ui/detail/components/color_and_size.dart';
import 'package:e_commerce/ui/detail/components/description.dart';
import 'package:e_commerce/ui/detail/components/fav_button.dart';
import 'package:e_commerce/ui/detail/components/product_title.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  // kalo disini berarti public
  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_checkout_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.30),
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultpadding),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        ColorAndSize(product: product),
                        const SizedBox(height: defaultpadding),
                        Description(product: product),
                        const SizedBox(height: defaultpadding),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [CartCounter(), FavButton()],
                        ),
                        const SizedBox(height: defaultpadding),
                        AddToCart(product: product),
                      ],
                    ),
                  ),
                  // Widget yang berguna
                  Positioned(
                    top: size.height * 0.05,
                    left: 0,
                    right: 0, // Mengatur right menjadi 0 agar lebih responsif
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultpadding),
                      child: ProductTitle(product: product),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

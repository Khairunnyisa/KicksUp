import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;
// ini adalah sebuah callback untuk mengirim quantity ke addtocart

  const CartCounter({
    super.key,
    required this.product,
  });

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  // biar defaultnya 1
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);

    return Row(
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(25, 25),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Icon(Icons.remove),
          // apabila quantity nya lebih dari 1, kalau true dia akan menjalankan decrement. buttonnya aktif
          onPressed: quantity > 1
              ? () {
                  setState(() {
                    // akan mengurangi quantity secara lokal (satu persatu)
                    quantity--;
                  });
                  // untuk mengirim quantity terbaru
                  cartProvider.removeItems(widget.product.id.toString());
                }
              // akan mendisable tombol jika kuantitas <= 1
              : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
          child: Text(
            quantity.toString().padLeft(2, "0"),
            style: TextStyle(fontSize: 18, color: textColor),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              minimumSize: Size(35, 35),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              // user bisa melakukan penambhan terus
              quantity++;
            });
            /* 
            - pendeklarasian informasi yang akan dikirimkan ke addToCart(tombol keranjang)
            - merupakan starting point dimana quantitas akan dibawa oleh tombol keranjang ke halaman cart screen
            */
            cartProvider.addItem(
                widget.product.id.toString(),
                widget.product.title,
                widget.product.price,
                widget.product.image,
                1);
          },
        )
      ],
    );
  }
}

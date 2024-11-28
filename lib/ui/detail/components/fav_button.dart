import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  // bentuk dari inisialisasi variable
  final Product product;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    // memeriksa apakah produk sudah ada di wishlist atau belum
    final isFavorite =
        wishlistProvider.wishlistItem.containsKey(product.id.toString());

    return IconButton(
      onPressed: () {
        // kalau dia ada di favorite, dia akan bisa melakukan remove
        if (isFavorite) {
          // untuk menghapus item dari wishlist
          wishlistProvider.removeItemFromFav(product.id.toString());
        } else {
          // kalau gaada, dia bakal masukin ini semua
          wishlistProvider.addItemToFav(
            // toString(): mengubah data menjadi string
            product.id.toString(),
            product.title,
            product.price,
            product.image,
          );
        }
      },
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
      color: isFavorite ? Colors.red : Colors.grey.shade800,
    );
  }
}

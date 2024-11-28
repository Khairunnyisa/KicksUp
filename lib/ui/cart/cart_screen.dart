import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/detail/components/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      // kondisi, action pertama(?),false(:) (action yang dilakuin kalau semisalkan kondisinya gak terpenuhi)
      // kalau misalkan didalam card provider kosong, kita bakal masukin apa
      body: cartProvider.items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Gambar untuk menunjukkan keranjang kosong
                  Image.asset(
                    'assets/images/empty_cart.png', // Ganti dengan path gambar kosong yang sesuai

                    height: 150,
                    fit: BoxFit
                        .contain, // Gambar akan menyesuaikan dengan ukuran yang tersedia tanpa merusak proporsi
                    width: double.infinity,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your cart is empty!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5), // List padding
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.items.values.toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8), // Space between items
                  child: Container(
                    padding:
                        const EdgeInsets.all(12), // Inner spacing for the item
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F9FC),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar produk
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cartItem.image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                            width: 12), // Jarak antara gambar dan detail produk

                        // Detail produk
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Judul produk
                              Text(
                                cartItem.title,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      4), // Spasi kecil antara judul dan kontrol

                              // Harga produk
                              Text(
                                "Rp${cartItem.price}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      8), // Spasi kecil sebelum kontrol kuantitas

                              // Kontrol kuantitas dan tombol hapus
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // Tombol Decrement
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors
                                                .white, // Background putih
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(
                                                10) // Bentuk bulat
                                            ),
                                        child: IconButton(
                                          icon: const Icon(Icons.remove,
                                              size:
                                                  24), // Ukuran ikon lebih besar
                                          onPressed: () {
                                            cartProvider
                                                .decreaseQuantity(cartItem.id);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                          width: 12), // Jarak antar elemen
                                      // Jumlah Kuantitas
                                      Text(
                                        "${cartItem.quantity}",
                                        style: const TextStyle(
                                          fontSize:
                                              18, // Ukuran teks lebih besar
                                          fontWeight: FontWeight
                                              .bold, // Menambahkan ketebalan teks
                                        ),
                                      ),
                                      const SizedBox(
                                          width: 12), // Jarak antar elemen
                                      // Tombol Increment
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.white, // Background putih
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(
                                              10), // Bentuk bulat
                                        ),
                                        child: IconButton(
                                          icon: const Icon(Icons.add,
                                              size:
                                                  24), // Ukuran ikon lebih besar
                                          onPressed: () {
                                            cartProvider
                                                .increaseQuantity(cartItem.id);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Tombol hapus
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      cartProvider.removeItems(cartItem.id);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Kotak untuk "Total Items"
            Container(
              padding: const EdgeInsets.all(15), // Padding di dalam kotak
              margin:
                  const EdgeInsets.only(bottom: 10), // Spasi bawah antar kotak
              decoration: BoxDecoration(
                color: const Color(0xFFF7F9FC), // Warna latar kotak
                borderRadius: BorderRadius.circular(10), // Radius sudut kotak
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Items",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${cartProvider.items.values.fold<int>(0, (sum, item) => sum + item.quantity)}", // Total kuantitas
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Kotak untuk "Selected Items"
            Container(
              padding: const EdgeInsets.all(15),
              margin:
                  const EdgeInsets.only(bottom: 15), // Spasi bawah antar kotak
              decoration: BoxDecoration(
                color: const Color(0xFFF7F9FC), // Warna latar kotak
                borderRadius: BorderRadius.circular(10), // Radius sudut kotak
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Selected Items(${cartProvider.items.length})",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Total: Rp${cartProvider.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Tombol Check Out
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Warna tombol Check Out
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Implementasi fungsi check-out
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Proceeding to checkout...')),
                  );
                },
                child: const Text(
                  "Check Out",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks pada tombol
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

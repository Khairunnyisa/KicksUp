import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ini adalah satu-satunya acuan untuk data yang digunakan
class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  //mendefinisikan variable yg kita buat
  Product({
    // this = untuk menandakan bahwa objek terkait hanya bisa diakses oleh Class terkait
    //atau class yang sebelumnya memanggil class product
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
  //  mengubah angka harga menjadi format yang lebih mudah dibaca
  String getFormattedPrice() {
    // mengatur cara angka ditampilkan sebagai mata uang.
    // decimalDigits: 0: Menentukan bahwa tidak ada angka di belakang koma.
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(price);
  }
}

List<Product> product = [
  Product(
      id: 1,
      title: "Dropset 3 Shoes",
      price: 200000,
      size: 12,
      description: descriptionText,
      image: "assets/images/adidas_shoe1.png",
      color: const Color(0xFFF7E5E7)),
  Product(
      id: 2,
      title: "Gazelle Los Angeles",
      price: 300000,
      size: 8,
      description: descriptionText,
      image: "assets/images/adidas_shoe2.png",
      color: const Color(0xFFE3ECED)),
  Product(
      id: 3,
      title: "Trae Unlimited Shoes",
      price: 600000,
      size: 10,
      description: descriptionText,
      image: "assets/images/adidas_shoe3.png",
      color: const Color(0xFFD4E0DF)),
  Product(
      id: 4,
      title: "Ultrarun 5 W Running",
      price: 300000,
      size: 11,
      description: descriptionText,
      image: "assets/images/adidas_shoe4.png",
      color: const Color(0xFFF4F0EC)),
  Product(
      id: 5,
      title: "Adidas Superstar Shoes",
      price: 700000,
      size: 12,
      description: descriptionText,
      image: "assets/images/adidas_shoe5.png",
      color: const Color(0xFFE9DEE0)),
  Product(
    id: 6,
    title: "Questar 3 Running",
    price: 300000,
    size: 12,
    description: descriptionText,
    image: "assets/images/adidas_shoe6.png",
    color: const Color(0xFFEBEAF0),
  ),
];

String descriptionText = "Lorem Ipsum Dolor Sit Amet";

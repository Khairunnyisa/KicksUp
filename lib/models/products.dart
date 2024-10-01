import 'package:flutter/material.dart';

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
}

List<Product> product = [
  Product(
      id: 1,
      title: "Dropset 3 Shoes",
      price: 2200000,
      size: 12,
      description: descriptionText,
      image: "assets/images/adidas_shoe1.png",
      color: const Color(0xFFDE97A1)),
  Product(
      id: 2,
      title: "Gazelle Los Angeles",
      price: 1300000,
      size: 8,
      description: descriptionText,
      image: "assets/images/adidas_shoe2.png",
      color: const Color(0xFF8EB3B9)),
  Product(
      id: 3,
      title: "Trae Unlimited Shoes",
      price: 1600000,
      size: 10,
      description: descriptionText,
      image: "assets/images/adidas_shoe3.png",
      color: const Color(0xFF538582)),
  Product(
      id: 4,
      title: "Ultrarun 5 W Running",
      price: 1300000,
      size: 11,
      description: descriptionText,
      image: "assets/images/adidas_shoe4.png",
      color: const Color(0xFFD3C2B4)),
  Product(
      id: 5,
      title: "Adidas Superstar Shoes",
      price: 1700000,
      size: 12,
      description: descriptionText,
      image: "assets/images/adidas_shoe5.png",
      color: const Color(0xFFA97B85)),
  Product(
    id: 6,
    title: "Questar 3 Running",
    price: 1300000,
    size: 12,
    description: descriptionText,
    image: "assets/images/adidas_shoe6.png",
    color: const Color(0xFFAEAAC5),
  ),
];

String descriptionText = "Lorem Ipsum Dolor Sit Amet";

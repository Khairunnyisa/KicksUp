import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // buat z kordinat, menghilangkan efek bayangan
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_checkout_outlined)),
        ],
      ),
      body: Column(
        // crossaxis: yg berlawanan dengan default sumbunya
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultpadding),
            child: Text(
              "Shoe",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
          ),
          // kita mau manggil categories, buat nampilin viewpager
          const Categories(),
          Expanded(
              // campuran column dan row
              // mainaxis: bakal ngikutin parent nya terus
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
            // gridview: nampilin list dengan berbentuk column dan list
            child: GridView.builder(
              // griddelegate: mengatur tata letak grid
              // sliver: untuk membungkus widget biasa supaya bisa ditempatkan dalam custom scrollview (lebih banyak opsi daripada slever)
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // crossaxis: bakal berlawanan sama parent
                  crossAxisCount: 2,
                  // jarak vertical antar item
                  mainAxisSpacing: defaultpadding,
                  // jarak horizontal antar item
                  crossAxisSpacing: defaultpadding,
                  // perbandingan tinggi dan lebar tiap item
                  childAspectRatio: 0.75),
              // biar nampilin, sesuai yang didalam data product (lenght)
              itemCount: product.length,

              // item builder itu pembangun UI (jadi jembatan dari ItemCard), ini kita ambil dari itemcard
              // buat pindah ke detail screen
              itemBuilder: (context, index) => ItemCard(
                  //ngambil dari product pake index karena berbentuk List
                  product: product[index],
                  // ekspektasinya bakal pindah ke detail, makanya pake navigator
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(product: product[index])))),
            ),
          ))
        ],
      ),
    );
  }
}

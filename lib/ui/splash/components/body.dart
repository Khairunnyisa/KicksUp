import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  final PageController _pageController = PageController();

  // List<String> product = List.generate(
  //   //kita mau generate our product
  //   10, (index) => "Product ${index + 1}"
  //   );

  // kalau kita mau bikin variable, harus didalam block code
  // dasar pengambilan data API
  List<Map<String, String>> splashData = [
    {
      "text": "Step Into Your Story",
      "image": "assets/images/splash_1.png",
      "description": "Time to flex your style and rock those kicks!"
    },
    {
      "text": "Crafted for Comfort",
      "image": "assets/images/splash_2.png",
      "description": "Shoes so comfy, you’ll forget you’re even wearing them!"
    },
    {
      "text": "Your Style, Your Rules",
      "image": "assets/images/splash_3.png",
      "description": "Dress how you want, no limits—just pure vibes!"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              // flex: memenuhi 3 ruang yang kosong
              flex: 3,
              //sizebox: jarak antara widget-widget
              child: SizedBox(
                  // double.infinity: dia bakal ngebawa widget ke tengah tengah, dgn titik kordinat berupa double (0.0)
                  width: double.infinity,
                  // builder: ngebangun UI, ngebangun datanya
                  // pageview: yg nge handle aktivitas swipe
                  child: PageView.builder(
                      //controlling route kita di pagebuilder (buat ganti-ganti page)
                      controller: _pageController,
                      // value: kita mau manggil sebuah argumen yang data type nya int maka gunakan value argumen
                      onPageChanged: (value) {
                        // initial state method for statefulWidget behaviour
                        setState(() {
                          currentPage = value;
                        });
                      },
                      // kita pake index karena kita pake tipe data list
                      // itemCount: untuk memberikan batasan swipe
                      // lenght: mendefinisakan panjang array nya berapa
                      itemCount: splashData.length,
                      // itembuilder: ngebuat jembatan (jembatan antara UI dan data)
                      itemBuilder: (context, index) => SplashContent(
                          text: splashData[index]["text"]!,
                          image: splashData[index]["image"]!,
                          description: splashData[index]["description"]!))),

              // safearea: biar gak nutupin sama sistem
            ),
            // buat bikin dots indicator
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // list.generate : buat ngehasilin sejumlah widet dots sesuai dengan panjang splashdata
              children: List.generate(
                  // bikin method extraction, kita pake index lagi, biar dimulai dari 0 lagi
                  splashData.length,
                  (index) => _dotsIndicator(index: index)),
            )),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                // elevatedbutton: paling normal, belum ada styling jadi bisa dikasih styling
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    //representasi dari function kosongan (jadi kita mau isi nanti)
                    //onPressed: action waktu user mau click button
                    onPressed: () {
                      // ketika currentpage nya = splash data, array itu mempresentasikan data. -1 karena dia index
                      if (currentPage == splashData.length - 1) {
                        // kode yang digunakan untuk berpindah antar halaman
                        Navigator.push(
                            //context: represent for our current page
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      } else {
                        //ini untuk swipe ke slide berikutnya, jadi kalau belum sampe slide akhir, buttonnya itu bakal menggerakkan ke halaman berikutnya dengan animatetopage
                        _pageController.animateToPage(currentPage + 1,
                            duration: animationDuration, curve: Curves.ease);
                      }
                    },
                    child: Text(
                      currentPage == splashData.length - 1 ? "Start" : "Next",
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  // kode untuk logika dots indicator
  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10),
      // decor dots indicator
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // ini if else untuk perubahan warna dots indicatornya
        color: currentPage == index ? primaryColor : secondaryColor,
      ),
      // kalau di halaman yg aktif, widthnya bakal 20 sama warnanya bakal primary, kalau gak aktif widthnya 10 sama colornya abuabu
      width: currentPage == index ? 20 : 10,
      height: 10,
      duration: animationDuration,
    );
  }
}

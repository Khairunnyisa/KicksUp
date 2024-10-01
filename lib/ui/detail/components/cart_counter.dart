import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(35, 35),
              // ngasitau biar padding nya 0, tetep pake padding kalau misalkan kita mau ada perubahan daripada si iconnya
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            // logic buat button decrease
            setState(() {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                });
              }
            });
          },
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: defaultpadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
          child: Text(
            // string interpolation: ketika kita mau manggil variable dalam string
            // konverensi dari string ke integer pake toString
            numOfItems.toString().padLeft(2, "0"),
            style: const TextStyle(fontSize: 18, color: textColor),
          ),
        ),
        const SizedBox(width: defaultpadding),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                minimumSize: const Size(35, 35),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              setState(() {
                numOfItems++;
              });
            },
            child: const Icon(Icons.add)),
      ],
    );
  }
}

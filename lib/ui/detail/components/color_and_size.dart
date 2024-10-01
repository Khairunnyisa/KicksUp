import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ColorAndSize extends StatelessWidget {
  final Product product;
  const ColorAndSize({super.key, required this.product});

  // menyimpan value size dan color
  // dan untuk nampilin bawah teks size dan color

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // expanded: responsive, memenuhi ruang kosong yang ada
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: [
                  ColorPicker(
                    color: Color(0xFF3D82AE),
                    isSelected: true,
                  ),
                  ColorPicker(
                    color: Color(0xFFF8C078),
                    isSelected: false,
                  ),
                  ColorPicker(
                    color: Color(0xFF989493),
                    isSelected: false,
                  )
                ],
              )
            ],
          ),
        ),
        // perbedaan text sama textspan:
        // sama2 untuk style font, text: superclass, textspan: subclass dari superclass richtext
        Expanded(
            // other way to showing and modyfing the text
            // richtext kalau kita punya tema untuk aplikasi (kayak dark sama light)
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Size",
              style: TextStyle(color: textColor),
            ),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: textColor),
                    children: [
                  TextSpan(
                      text: "${product.size} cm",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold))
                ])),
          ],
        ))
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultpadding, right: defaultpadding),
      padding: const EdgeInsets.all(2.5),
      width: 25,
      height: 25,
      // modifikasi untuk border dari colorpickernya
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              // logic buat color picker
              color: isSelected ? color : Colors.transparent)),
      // decoratedbox: biar kita bisa pake subclass yang ada di boxdecoration, biar bisa bungkus widget lain
      child: DecoratedBox(
          // karena boxdecoration gaada widget makanya pake decoratedbox
          // modifikasi untuk colorPickernya
          decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    );
  }
}

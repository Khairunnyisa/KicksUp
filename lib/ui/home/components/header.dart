import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<Map<String, String>> headerImages;

  const Header({super.key, required this.headerImages});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          itemCount: headerImages.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  headerImages[index]['image']!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../util/constants.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final String image;
  const CategoryCard({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 210,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.fill,
            scale: 0.3,
          ),
          Positioned(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

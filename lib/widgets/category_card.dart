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
      width: 170,
      height: 110,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.fill,
            scale: 0.3,
          ),
          Text(
            text,
            style: const TextStyle(
                fontFamily: fontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

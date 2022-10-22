import 'package:flutter/material.dart';

import '../util/constants.dart';

class SimilarProductCard extends StatelessWidget {
  const SimilarProductCard(
      {super.key,
      required this.image,
      required this.drugName,
      required this.drugType,
      required this.qty,
      required this.price});

  final Widget image;
  final String drugName;
  final String drugType;
  final String qty;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF828282).withOpacity(0.2),
              blurRadius: 15.0,
              offset: const Offset(0.0, 7.0),
            )
          ]),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 140, child: image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  drugName,
                  style: const TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF363636),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$drugType・$qty',
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF363636).withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${AppStrings.naira}$price',
                      style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

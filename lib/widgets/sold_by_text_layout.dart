import 'package:flutter/material.dart';

import '../model/product.dart';
import '../util/constants.dart';

class SoldByText extends StatelessWidget {
  const SoldByText({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SOLD BY',
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8EA5BC),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          product.productDetails.soldBy,
          style: const TextStyle(
            fontFamily: fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF13447A),
          ),
        )
      ],
    );
  }
}

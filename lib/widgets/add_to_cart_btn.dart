import 'package:flutter/material.dart';
import 'package:pharmacy/util/colors.dart';

import '../util/constants.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gradientStart, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white),
      child: Center(
        child: Text(
          'ADD TO CART',
          style: const TextStyle(
              fontFamily: fontFamily,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.gradientStart),
        ),
      ),
    );
  }
}

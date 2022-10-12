import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/util/colors.dart';

import '../util/constants.dart';

class ProductInfo extends StatelessWidget {
  final String image;
  final String title;
  final String info;
  const ProductInfo(
      {super.key,
      required this.image,
      required this.title,
      required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        SvgPicture.asset(
          image,
          color: AppColors.gradientStart,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: fontFamily,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8EA5BC),
              ),
            ),
            Text(
              info,
              style: const TextStyle(
                fontFamily: fontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF13447A),
              ),
            )
          ],
        )
      ]),
    );
  }
}

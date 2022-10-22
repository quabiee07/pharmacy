import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/sold_by_text_layout.dart';

import '../model/product.dart';
import 'custom_fav_icon.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(.8)),
              shape: BoxShape.circle,
              color: Colors.white),
          child: const Icon(Icons.local_hospital_rounded),
        ),
        const SizedBox(
          width: 15,
        ),
        SoldByText(product: product),
        const Spacer(),
        CustomFavButton()
      ],
    );
  }
}

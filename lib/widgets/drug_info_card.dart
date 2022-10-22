import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/add_to_cart_btn.dart';
import 'package:pharmacy/widgets/custom_fav_icon.dart';

import '../util/constants.dart';

class DrugInfoCard extends StatelessWidget {
  final Widget image;
  final String drugName;
  final String drugType;
  final String qty;
  final String price;
  final int index;
  final Function()? onTapped;
  const DrugInfoCard({
    Key? key,
    required this.drugName,
    required this.drugType,
    required this.qty,
    required this.price,
    required this.image,
    required this.index,
    this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(7.0),
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
                        style: const TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF363636),
                        ),
                      ),
                      const SizedBox(
                        width: 48,
                      ),
                      CustomFavButton()
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  AddToCartButton()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

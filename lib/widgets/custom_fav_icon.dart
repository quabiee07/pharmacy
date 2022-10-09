import 'package:flutter/material.dart';

import '../util/colors.dart';

class CustomFavButton extends StatefulWidget {
  CustomFavButton({Key? key}) : super(key: key);

  @override
  State<CustomFavButton> createState() => _CustomFavButtonState();
}

class _CustomFavButtonState extends State<CustomFavButton> {
  final bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: AppColors.gradientStart.withOpacity(.10),
        ),
        child: isClicked
            ? Icon(Icons.favorite, color: AppColors.gradientStart)
            : Icon(
                Icons.favorite_border_outlined,
                color: AppColors.gradientStart,
              ));
  }
}

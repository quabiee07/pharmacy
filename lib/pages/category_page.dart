import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/constants.dart';
import '../widgets/category_card.dart';

class CategoryPage extends StatelessWidget {
  
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientStart,
                  AppColors.gradientEnd,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 120,
                  child: Image.asset(
                    'assets/spiral.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 66,
                  left: 24,
                  right: 24,
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        AppStrings.category,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      const Spacer(),
                      Image.asset('assets/cart.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Wrap(
              children: const [
                CategoryCard(
                  text: AppStrings.headache,
                  image: 'assets/headache.png',
                ),
                CategoryCard(
                  text: AppStrings.supplements,
                  image: 'assets/supplements.png',
                ),
                CategoryCard(
                  text: AppStrings.infant,
                  image: 'assets/infant.png',
                ),
                CategoryCard(
                  text: AppStrings.cough,
                  image: 'assets/cough.png',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

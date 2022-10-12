import 'package:flutter/material.dart';
import 'package:pharmacy/pages/category_page.dart';
import 'package:pharmacy/pages/product_details_page.dart';
import 'package:pharmacy/util/colors.dart';
import 'package:pharmacy/widgets/drug_info_card.dart';
import 'package:pharmacy/widgets/frosty_textfield.dart';

import '../model/product.dart';
import '../util/constants.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: 171,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
                        const Text(
                          AppStrings.pharmacy,
                          style: TextStyle(
                              fontFamily: fontFamily,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        Image.asset('assets/truck.png'),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 114,
                    left: 24,
                    right: 24,
                    child: FrostyTextField(),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: 40,
              padding: const EdgeInsets.only(
                top: 10,
                left: 25,
                right: 25,
              ),
              color: const Color(0xFFF2F2F2),
              child: Row(
                children: [
                  Image.asset('assets/location.png'),
                  const SizedBox(width: 10),
                  RichText(
                    text: const TextSpan(
                      text: 'Delivery in ',
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Lagos, NG',
                          style: TextStyle(
                              fontFamily: fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'CATEGORIES',
                        style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF363636).withOpacity(0.4),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoryPage(),
                              ));
                        },
                        child: const Text(
                          'VIEW ALL',
                          style: TextStyle(
                              fontFamily: fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gradientStart),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
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
                  ),
                  Text(
                    'SUGGESTIONS',
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF363636).withOpacity(0.4),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 300,
                    child: GridView.count(
                      childAspectRatio: 0.66,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        products.length,
                        (index) => DrugInfoCard(
                          drugName: products[index].productName,
                          drugType: products[index].productType,
                          qty: products[index].productQty,
                          price: products[index].productPrice,
                          image: Hero(
                            tag:'image$index',
                            child: Image.asset(
                              products[index].productImage,
                            ),
                          ),
                          index: index,
                          onTapped: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(
                                      product: products[index]),
                                ));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     backgroundColor: AppColors.gradientStart,
      //     onPressed: () {},
      //     label: Text('Checkout')),
    );
  }
}

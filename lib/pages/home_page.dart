import 'package:flutter/material.dart';
import 'package:pharmacy/util/colors.dart';
import 'package:pharmacy/widgets/drug_info_card.dart';
import 'package:pharmacy/widgets/frosty_textfield.dart';

import '../util/constants.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SingleChildScrollView(
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
              height: 16,
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
                      Spacer(),
                      const Text(
                        'VIEW ALL',
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.gradientStart),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
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
                      color: Color(0xFF363636).withOpacity(0.4),
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Spacer(),
                            DrugInfoCard(
                              drugName: 'Paracetamol',
                              drugType: 'Tablet',
                              qty: '500mg',
                              price: '350.00',
                              image: 'assets/paracetamol.png',
                            ),
                            Spacer(),
                            DrugInfoCard(
                              drugName: 'Doliprane',
                              drugType: 'Capsule',
                              qty: '1000mg',
                              price: '350.00',
                              image: 'assets/doliprane.png',
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Spacer(),
                            DrugInfoCard(
                              drugName: 'Paracetamol',
                              drugType: 'Tablet',
                              qty: '500mg',
                              price: '350.00',
                              image: 'assets/paracetamol1.png',
                            ),
                            Spacer(),
                            DrugInfoCard(
                              drugName: 'Ibuprofen',
                              drugType: 'Tablet',
                              qty: '200mg',
                              price: '350.00',
                              image: 'assets/ibuprofen.png',
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Spacer(),
                            DrugInfoCard(
                              drugName: 'Panadol',
                              drugType: 'Tablet',
                              qty: '500mg',
                              price: '350.00',
                              image: 'assets/panadol.png',
                            ),
                            Spacer(),
                            DrugInfoCard(
                              drugName: 'Ibuprofen',
                              drugType: 'Tablet',
                              qty: '400mg',
                              price: '350.00',
                              image: 'assets/ibuprofen1.jpg',
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: Text('Checkout')),
    );
  }
}

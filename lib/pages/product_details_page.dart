import 'package:flutter/material.dart';
import 'package:pharmacy/widgets/product_details_info.dart';

import '../model/product.dart';
import '../util/colors.dart';
import '../util/constants.dart';
import '../widgets/logo_and_fav_icon.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 0;
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
                        AppStrings.pharmacy,
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
            height: 5,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag: 'image',
                      child: Image.asset(widget.product.productImage),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      widget.product.productName,
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(.8)),
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: widget.product.productType,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.4)),
                        children: [
                          TextSpan(
                            text: ' - ${widget.product.productQty}',
                            style: TextStyle(
                                fontFamily: fontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(.4)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  CompanyLogo(product: widget.product),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 96,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF8282824D).withOpacity(.3),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quantity--;
                                });
                              },
                              child: Text(
                                '-',
                                style: TextStyle(
                                    fontFamily: fontFamily,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(.8)),
                              ),
                            ),
                            Text(
                              '$quantity',
                              style: TextStyle(
                                  fontFamily: fontFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black.withOpacity(.8)),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Text(
                                '+',
                                style: TextStyle(
                                    fontFamily: fontFamily,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(.8)),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '${widget.product.productDetails.dispensedIn}(s)',
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.5)),
                      ),
                      const SizedBox(
                        width: 104,
                      ),
                      Text(
                        '${AppStrings.naira}${widget.product.productPrice}',
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(.8)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  const Text(
                    'PRODUCT DETAILS',
                    style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF8EA5BC)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProductInfo(
                        image: 'assets/packSize.svg',
                        title: 'PACK SIZE',
                        info: widget.product.productDetails.packSize,
                      ),
                      // Spacer(),
                      ProductInfo(
                        image: 'assets/productId.svg',
                        title: 'PRODUCT ID',
                        info: widget.product.productDetails.productId,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProductInfo(
                        image: 'assets/packs.svg',
                        title: 'CONSTITUENTS',
                        info: widget.product.productDetails.constituents,
                      ),
                      // Spacer(),
                      ProductInfo(
                        image: 'assets/dispense.svg',
                        title: 'DISPENSED IN',
                        info: widget.product.productDetails.dispensedIn,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Center(
                    child: Text(
                      '$quantity pack of ${widget.product.productName}(${widget.product.productQty}) contains ${widget.product.productDetails.packSize[0]} units of ${widget.product.productDetails.packSize[5]} tablets ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(.5)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

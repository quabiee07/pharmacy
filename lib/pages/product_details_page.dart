import 'package:flutter/material.dart';
import 'package:pharmacy/providers/cart_provider.dart';
import 'package:pharmacy/widgets/product_details_info.dart';
import 'package:provider/provider.dart';

import '../database/database_service.dart';
import '../model/cart.dart';
import '../model/product.dart';
import '../util/colors.dart';
import '../util/constants.dart';
import '../widgets/logo_and_fav_icon.dart';
import '../widgets/similar_product_ card.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 0;
  final dbHelper = DatabaseService.instance;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
                          'Product Info',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                            text:
                                ' - ${widget.product.productQty}${widget.product.productUnit}',
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
                      // const SizedBox(
                      //   width: 90,
                      // ),
                      const Spacer(),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductInfo(
                              image: 'assets/packSize.svg',
                              title: 'PACK SIZE',
                              info: widget.product.productDetails.packSize,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProductInfo(
                              image: 'assets/packs.svg',
                              title: 'CONSTITUENTS',
                              info: widget.product.productDetails.constituents,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductInfo(
                              image: 'assets/productId.svg',
                              title: 'PRODUCT ID',
                              info: widget.product.productDetails.productId,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ProductInfo(
                              image: 'assets/dispense.svg',
                              title: 'DISPENSED IN',
                              info: widget.product.productDetails.dispensedIn,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Center(
                    child: Text(
                      '$quantity pack of ${widget.product.productName}(${widget.product.productQty}) contains ${widget.product.productDetails.packSize[0]} units of ${widget.product.productDetails.packSize[5]} tablets ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(.5)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Similar Products',
                    style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return SimilarProductCard(
                          image: Image.asset(products[index].productImage),
                          drugName: products[index].productName,
                          drugType: products[index].productType,
                          qty: products[index].productQty,
                          price: products[index].productPrice.toString(),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 15,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 90,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: const Color(0xFF828282).withOpacity(0.2),
            blurRadius: 15.0,
            offset: const Offset(7.0, 0.0),
          ),
        ]),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: AddButton(
          pressed: () {
            addItemToCart();
          },
        ),
      ),
    );
  }

  void addItemToCart() {
    final cart = Provider.of<CartProvider>(context,listen: false);
    int index = 0;
    dbHelper
        .insertItem(Cart(
            id: index,
            productId: index.toString(),
            productName: products[index].productName,
            initialPrice: products[index].productPrice,
            productPrice: products[index].productPrice,
            quantity: ValueNotifier(1),
            unitTag: products[index].productUnit,
            image: products[index].productImage))
        .then((value) {
      cart.addTotalPrice(
          products[index].productPrice.toDouble(), cart.addCounter());
      debugPrint('Product added to cart');
      cart.addCounter();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}

class AddButton extends StatelessWidget {
  final Function()? pressed;
  const AddButton({
    Key? key,
    required this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: const LinearGradient(
            colors: [
              AppColors.gradientStart,
              AppColors.gradientEnd,
            ],
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Add to cart',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

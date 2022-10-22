import 'package:pharmacy/model/product_details.dart';

class Product {
  final int position;
  final String productImage;
  final String productName;
  final String productType;
  final String productQty;
  final int productPrice;
  final String productUnit;
  final ProductDetails productDetails;

  Product(
    this.position, {
    required this.productImage,
    required this.productName,
    required this.productType,
    required this.productQty,
    required this.productPrice,
    required this.productUnit,
    required this.productDetails,
  });
}

List<Product> products = [
  Product(
    1,
    productImage: 'assets/paracetamol.png',
    productName: 'Paracetamol',
    productType: 'Tablet',
    productQty: '500',
    productPrice: 350,
    productUnit: 'mg',
    productDetails: ProductDetails(
      soldBy: 'Emzor Pharmaceuticals',
      packSize: '8 x 12 tablets (96)',
      productId: 'PRO23648856',
      constituents: 'Paracetamol',
      dispensedIn: 'Packs',
    ),
  ),
  Product(2,
      productImage: 'assets/doliprane.png',
      productName: 'Doliprane',
      productType: 'Capsule',
      productQty: '1000',
      productPrice: 350,
      productUnit: 'mg',
      productDetails: ProductDetails(
        soldBy: 'SANOFI',
        packSize: '8 x 12 capsules (96)',
        productId: 'PRO23648856',
        constituents: 'Paracetamol',
        dispensedIn: 'Packs',
      )),
  Product(3,
      productImage: 'assets/paracetamol1.png',
      productName: 'Paracetamol',
      productType: 'Tablet',
      productQty: '500',
      productPrice: 350,
      productUnit: 'mg',
      productDetails: ProductDetails(
        soldBy: 'Ratiopharm',
        packSize: '4 x 4 tablets (16)',
        productId: 'PRO23648856',
        constituents: 'Paracetamol',
        dispensedIn: 'Packs',
      )),
  Product(4,
      productImage: 'assets/ibuprofen.png',
      productName: 'Ibuprofen',
      productType: 'Tablet',
      productQty: '200',
      productPrice: 350,
      productUnit: 'mg',
      productDetails: ProductDetails(
        soldBy: 'Morrisons',
        packSize: '4 x 4 tablets (16)',
        productId: 'PRO23648856',
        constituents: 'Ibuprofen',
        dispensedIn: 'Packs',
      )),
  Product(5,
      productImage: 'assets/panadol.png',
      productName: 'Panadol',
      productType: 'Tablet',
      productQty: '500',
      productPrice: 350,
      productUnit: 'mg',
      productDetails: ProductDetails(
        soldBy: 'Gsk',
        packSize: '2 x 2 tablets (4) ',
        productId: 'PRO23648856',
        constituents: 'Panadol',
        dispensedIn: 'Cards',
      )),
  Product(6,
      productImage: 'assets/ibuprofen1.jpg',
      productName: 'Ibuprofen',
      productType: 'Tablet',
      productQty: '400',
      productPrice: 350,
      productUnit: 'mg',
      productDetails: ProductDetails(
        soldBy: 'Apo-rot',
        packSize: '2 x 25 tablets (50)',
        productId: 'PRO23648856',
        constituents: 'Ibuprofen',
        dispensedIn: 'Packs',
      )),
];

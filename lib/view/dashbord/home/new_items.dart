import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/constants/images_constants.dart';
import 'package:test_app/constants/utils/text_styles.dart';

class NewItemsSection extends StatelessWidget {
  final List<Product> newItems = [
  Product(imageUrl: ImagesConstants.iconOne, price: 17.00),
  Product(imageUrl: ImagesConstants.iconthree, price: 32.00),
  Product(imageUrl: ImagesConstants.iconFour, price: 21.00),
  Product(imageUrl: ImagesConstants.iconOne, price: 32.00),
  Product(imageUrl: ImagesConstants.iconTwo, price: 21.00),
];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newItems.length,
        itemBuilder: (context, index) {
          final item = newItems[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(item.imageUrl, height: 120, width: 100, fit: BoxFit.cover),
                ),
                 TextStyles.subTitleTextStyle("Lorem ipsum  \ndolor sit amet "),
                Text("\$${item.price}", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final double price;
  Product({required this.imageUrl, required this.price});
}

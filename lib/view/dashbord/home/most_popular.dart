import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/constants/images_constants.dart';
import 'package:test_app/constants/utils/text_styles.dart';

class MostPopular extends StatelessWidget {
  final List<Product> newItems = [
  Product(imageUrl: ImagesConstants.iconOne, price: 17.00),
  Product(imageUrl: ImagesConstants.iconOne, price: 32.00),
  Product(imageUrl: ImagesConstants.iconTwo, price: 21.00),
  Product(imageUrl: ImagesConstants.iconFour, price: 32.00),
  Product(imageUrl: ImagesConstants.iconthree, price: 21.00),
];

   MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newItems.length,
        itemBuilder: (context, index) {
          final item = newItems[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(item.imageUrl, height: 120, width: 100, fit: BoxFit.cover),
                ),
                SizedBox(height: 8),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextStyles.subTitleTextStyle("1232"),
                                  SizedBox(width: 6.w),

                Text("New", style: TextStyle(fontWeight: FontWeight.bold)),
               ],)
               
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

import 'package:flutter/material.dart';
import 'package:test_app/constants/images_constants.dart';
import 'package:test_app/constants/utils/image.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      items: [
        BottomNavigationBarItem(
          label: "",
          icon: CommonImages(
            assetName: ImagesConstants.shop,
            isSvg: false,
          ),
        ),
         BottomNavigationBarItem(
           label: "",
          icon: CommonImages(
            assetName: ImagesConstants.heart,
            isSvg: false,
          ),
        ), BottomNavigationBarItem(
           label: "",
          icon: CommonImages(
            assetName: ImagesConstants.filterIcon,
            isSvg: false,
          ),
        ), BottomNavigationBarItem(
           label: "",
          icon: CommonImages(
            assetName: ImagesConstants.cart,
            isSvg: false,
          ),
        ), BottomNavigationBarItem(
           label: "",
          icon: CommonImages(
            assetName: ImagesConstants.about,
            isSvg: false,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CommonImages extends StatelessWidget {
  bool isSvg;
  String assetName;
  CommonImages({super.key, required this.assetName, required this.isSvg});

  @override
  Widget build(BuildContext context) {
    if (isSvg == true) {
      return SvgPicture.asset(assetName);
    } else {
      return Image.asset(assetName);
    }
  }
}

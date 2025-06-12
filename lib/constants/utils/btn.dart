import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/constants/app_colors.dart';

class Btn extends StatelessWidget {
  VoidCallback? onPressed;
  String? txt;
  Btn({super.key, required this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(150.w, 5.h),
        backgroundColor: AppColors.blueBtn,

        foregroundColor: AppColors.whiteColor,
      ),
      onPressed: onPressed,
      child: Text(
        txt ?? "",
        style: TextStyle(fontWeight: FontWeight.w200, fontSize: 2.h),
      ),
    );
  }
}

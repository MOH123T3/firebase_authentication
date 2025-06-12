import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/constants/app_strings.dart';
import 'package:test_app/constants/images_constants.dart';
import 'package:test_app/constants/utils/btn.dart';
import 'package:test_app/constants/utils/image.dart';
import 'package:test_app/constants/utils/text_styles.dart';
import 'package:test_app/constants/utils/utils.dart';
import 'package:test_app/routes/app_routes.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Utils.sizdH(20),

                CircleAvatar(
                  backgroundImage: AssetImage(ImagesConstants.circle),
                  radius: 80,
                  backgroundColor: AppColors.whiteColor,
                  child: CommonImages(
                    assetName: ImagesConstants.shoppingBag,
                    isSvg: true,
                  ),
                ),
                Utils.sizdH(3),
                TextStyles.headingTextStyle(AppStrings.shoppe),
                Utils.sizdH(3),

                TextStyles.titleTextStyle(AppStrings.beautifulECommerce),
                Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 7.h,
                  child: Btn(
                    onPressed: () {
                      Get.toNamed(AppRoutes.logiScreen);
                    },
                    txt: AppStrings.letsGetStarted,
                  ),
                ),
                Utils.sizdH(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextStyles.subTitleTextStyle(AppStrings.alreadyhaveAccount),
                    SizedBox(width: 4),

                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.createAccount);
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        color: AppColors.blueBtn,
                        size: 4.h,
                      ),
                    ),
                  ],
                ),
                Utils.sizdH(5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/constants/app_strings.dart';
import 'package:test_app/constants/images_constants.dart';
import 'package:test_app/constants/utils/image.dart';
import 'package:test_app/constants/utils/text_styles.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/constants/app_strings.dart';
import 'package:test_app/constants/common_txt_field.dart';
import 'package:test_app/constants/images_constants.dart';
import 'package:test_app/constants/utils/btn.dart';
import 'package:test_app/constants/utils/image.dart' show CommonImages;
import 'package:test_app/constants/utils/text_styles.dart';
import 'package:test_app/constants/utils/utils.dart';
import 'package:test_app/routes/app_routes.dart';
import 'package:test_app/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
          children: [
            Positioned(
              top: -80,
              left: -60,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: AppColors.themeColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: -60,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.blueBtn,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              top: 40,
              right: -60,
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  color: Color(0xFF005DFF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              right: -60,
              child: Container(
                width: 300,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xFFEFF3FF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ListView(
                    children: [
                      Utils.sizdH(4.h),

                      TextStyles.leadingTextStyle(AppStrings.login),
                      Utils.sizdH(1),
                      Row(
                        children: [
                          TextStyles.titleTextStyle(AppStrings.goodTo),
                          Utils.sizdW(2),

                          Icon(Icons.favorite, color: Colors.black, size: 20),
                        ],
                      ),

                      Utils.sizdH(0.5.h),

                      CommonTxtField(
                        controller: emailController,
                        hintText: "Email",
                        labelText: "Email",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please entter email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      CommonTxtField(
                        controller: passwordController,
                        hintText: "Password",
                        labelText: "Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter password";
                          } else {
                            return null;
                          }
                        },
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 7.h,
                        child: Btn(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print('object');

                              try {
                                User? user = await _firebaseServices
                                    .loginWithEmailPass(
                                      emailController.text.trim(),
                                      passwordController.text.trim(),
                                    );

                                if (user != null) {
                                  Get.snackbar(
                                    'Done',
                                    'successfully Login',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.black,
                                    colorText: Colors.white,
                                    duration: Duration(seconds: 3),
                                  );
                                  Get.toNamed(AppRoutes.card);
                                } else {
                                  Get.snackbar(
                                    'Fail',
                                    'invalid email or password',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.black,
                                    colorText: Colors.white,
                                    duration: Duration(seconds: 3),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login failed: $e')),
                                );
                              }
                            }
                            // Get.toNamed(AppRoutes.logiScreen);
                          },
                          txt: AppStrings.login,
                        ),
                      ),
                      SizedBox(height: 20),

                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.register);
                          },

                          child: TextStyles.titleTextStyle(AppStrings.register),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

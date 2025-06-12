import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
                width: 300,
                height: 350,
                decoration: const BoxDecoration(
                  color: Color(0xFFEFF3FF),
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
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ListView(
                    children: [
                      Utils.sizdH(1.h),

                      TextStyles.leadingTextStyle(AppStrings.createAccount),
                      Utils.sizdH(2),

                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40.sp,
                        child: CommonImages(
                          assetName: ImagesConstants.uploadPhoto,
                          isSvg: false,
                        ),
                      ),
                      Utils.sizdH(1.h),

                      CommonTxtField(
                        controller: nameController,
                        hintText: "Full Name",
                        labelText: "Full Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter full name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),

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
                        isPassword: true,
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
                      SizedBox(height: 10),
                      PhoneInputField(controller: phoneController),

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
                                    .registerWithEmail(
                                      emailController.text.trim(),
                                      passwordController.text.trim(),
                                    );

                                if (user != null) {
                                  Get.snackbar(
                                    'Done',
                                    'successfully register',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.black,
                                    colorText: Colors.white,
                                    duration: Duration(seconds: 3),
                                  );

                                  Get.toNamed(AppRoutes.logiScreen);
                                } else{

                                  Get.snackbar(
                                    'Fail',
                                    'Already Used',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.black,
                                    colorText: Colors.white,
                                    duration: Duration(seconds: 3),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login failed: $e')));
                              }
                            }
                          },
                          txt: AppStrings.register,
                        ),
                      ),

                      SizedBox(height: 20),

                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.logiScreen);
                          },

                          child: TextStyles.titleTextStyle(AppStrings.login),
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

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: (code) {},
            initialSelection: 'IN',
            showFlag: true,
            showDropDownButton: true,
            hideSearch: true,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Your number',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

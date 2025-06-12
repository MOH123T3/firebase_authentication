import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/constants/images_constants.dart';
import 'package:test_app/constants/utils/btn.dart';
import 'package:test_app/routes/app_routes.dart';

class SlidableCardScreen extends StatefulWidget {
  const SlidableCardScreen({super.key});

  @override
  State<SlidableCardScreen> createState() => _SlidableCardScreenState();
}

class _SlidableCardScreenState extends State<SlidableCardScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Hello",
      "desc":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.",
      "image": ImagesConstants.iconOne,
    },
    {
      "title": "Ready?",
      "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "image": ImagesConstants.iconTwo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          // Top blue background circle
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF005DFF),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Expanded(
                child: PageView.builder(
                
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 40,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(34),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(24),
                                ),
                                child: Image.asset(
                                  item["image"]!,
                                  height: 400,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  children: [
                                    Text(
                                      item["title"]!,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item["desc"]!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                          
                                    SizedBox(height: 12.h),
                                    item['title'] == "Ready?"
                                        ? SizedBox(
                                          height: 7.h,
                                          width: 60.w,
                                          child: Btn(
                                            onPressed: () {
                                              Get.toNamed(AppRoutes.dashbord);
                                            },
                                            txt: "Let's Start",
                                          ),
                                        )
                                        : Center(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => _buildDot(index == _currentIndex),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: isActive ? 10 : 8,
      height: isActive ? 10 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.blue.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
    );
  }
}

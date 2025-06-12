import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/constants/images_constants.dart';
import 'package:test_app/constants/utils/btn.dart';
import 'package:test_app/constants/utils/image.dart';
import 'package:test_app/constants/utils/text_styles.dart';
import 'package:test_app/view/dashbord/home/most_popular.dart' show MostPopular;
import 'package:test_app/view/dashbord/home/new_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(ImagesConstants.person),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Btn(onPressed: () {}, txt: "My Activity"),
                  const Spacer(),

                  SizedBox(
                    height: 6.h,
                    width: 12.w,
                    child: CommonImages(
                      assetName: ImagesConstants.voucher,
                      isSvg: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 6.h,
                    width: 12.w,
                    child: CommonImages(
                      assetName: ImagesConstants.topMenu,
                      isSvg: true,
                    ),
                  ),

                  const SizedBox(width: 10),
                  SizedBox(
                    height: 6.h,
                    width: 12.w,
                    child: CommonImages(
                      assetName: ImagesConstants.settings,
                      isSvg: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Welcome text
              const Text(
                "Hello, Romina!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Announcement Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextStyles.titleTextStyle("Announcement"),
                          Text(
                            "Lorem ipsum dolor sit amet. Maecenas hendrerit luctus libero ac vulputate.",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_circle_right,
                      color: AppColors.blueBtn,
                      size: 30,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              TextStyles.titleBTextStyle("Recently viewed"),
              const SizedBox(height: 12),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                          index == 0
                                ? ImagesConstants.iconOne
                                :   index == 1
                                ?   ImagesConstants.iconTwo
                                :   index == 2
                                ?   ImagesConstants.iconthree
                                :   index == 3
                                ?   ImagesConstants.iconFour
                                :   index == 4
                                ?   ImagesConstants.iconTwo : ImagesConstants.iconTwo,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              TextStyles.titleBTextStyle("My Orders"),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _orderTab("To Pay"),

                  _orderTab("To Receive", isActive: true),
                  _orderTab("To Review"),
                ],
              ),

              const SizedBox(height: 20),

              TextStyles.titleBTextStyle("Stories"),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            index == 0
                                ? ImagesConstants.iconOne
                                :   index == 1
                                ?   ImagesConstants.iconTwo
                                :   index == 2
                                ?   ImagesConstants.iconthree
                                :   index == 3
                                ?   ImagesConstants.iconFour
                                :   index == 4
                                ?   ImagesConstants.iconTwo : ImagesConstants.iconTwo,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          if (index == 0)
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "Live",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          const Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  TextStyles.titleBTextStyle("New Items"),
                  const Spacer(),
                  seeAll(),
                ],
              ),
              const SizedBox(height: 10),
               NewItemsSection(),
              const SizedBox(height: 20),

              Row(
                children: [
                  TextStyles.titleBTextStyle("Most Popular"),
                  const Spacer(),
                  seeAll(),
                ],
              ),
              const SizedBox(height: 10),
                            MostPopular(),

              const SizedBox(height: 20),

              Row(
                children: [
                  TextStyles.titleBTextStyle("Categories"),
                  const Spacer(),
                  seeAll(),
                ],
              ),
              const SizedBox(height: 10),
              NewItemsSection(), const SizedBox(height: 20),

              Row(
                children: [
                  TextStyles.titleBTextStyle("Flash Sale"),
                  const Spacer(),
                  seeAll(),
                ],
              ),
              const SizedBox(height: 10),
              NewItemsSection(),
              Row(
                children: [
                  TextStyles.titleBTextStyle("Top Products"),
                  const Spacer(),
                  seeAll(),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                          index == 0
                                ? ImagesConstants.iconOne
                                :   index == 1
                                ?   ImagesConstants.iconTwo
                                :   index == 2
                                ?   ImagesConstants.iconthree
                                :   index == 3
                                ?   ImagesConstants.iconFour
                                :   index == 4
                                ?   ImagesConstants.iconTwo : ImagesConstants.iconTwo,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  TextStyles.titleBTextStyle("Just For You"),
                  const Spacer(),
                  seeAll(),
                ],
              ),
              const SizedBox(height: 10),
              NewItemsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderTab(String label, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.blueBtn,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(left: 6),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  seeAll() {
    return Row(
      children: [
        TextStyles.subTitleTextStyle("See All"),
        SizedBox(width: 2),

        Icon(Icons.arrow_circle_right, color: AppColors.blueBtn, size: 30),
      ],
    );
  }
}

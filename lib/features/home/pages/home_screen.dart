import '../../../core/constants/app_images.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/widgets/custom_svg_picture.dart';
import '../widgets/best_seller_books.dart';
import '../widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: CustomSvgPicture(path: AppImages.logoSvg, height: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomSvgPicture(path: AppImages.searchSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              HomeSlider(),
              Gap(30),
              Text(
                'Best Seller',
                style: TextStyles.title.copyWith(fontWeight: FontWeight.w400),
              ),
              Gap(15),
              GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 0.6,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              child: Image.asset(
                                AppImages.book1,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gap(10),
                          BestSellerBooks(),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

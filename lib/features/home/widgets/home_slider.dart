import '../../../core/constants/app_images.dart';
import '../../../core/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int yourActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset(
                      AppImages.slider,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          options: CarouselOptions(
            height: 150,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                yourActiveIndex = index;
              });
            },
          ),
        ),
        Gap(14),
        AnimatedSmoothIndicator(
          activeIndex: yourActiveIndex,
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 7,
            dotWidth: 7,
            activeDotColor: AppColors.primaryColor,
            dotColor: AppColors.borderColor,
            expansionFactor: 4,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import '../cubit/home_cubit.dart';
import '../widgets/best_seller_books.dart';
import '../widgets/home_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..initLoadData(),
      child: Scaffold(
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

                BestSellerBooks(),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

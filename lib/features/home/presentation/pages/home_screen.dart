import 'package:bookia/core/functions/extencion.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/search/presentation/pages/search_screen.dart';
import 'package:easy_localization/easy_localization.dart';
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
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: CustomSvgPicture(path: AppImages.logoSvg, height: 30),
              actions: [
                IconButton(
                  onPressed: () {
                    final products = context.read<HomeCubit>().products;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(products: products),
                      ),
                    );
                  },
                  icon: CustomSvgPicture(path: AppImages.searchSvg),
                ),
                IconButton(
                  onPressed: () {
                    bool isArabic = context.isArabic;
                    context.setLocale(Locale(isArabic ? 'en' : 'ar'));
                  },
                  icon: Icon(Icons.language),
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
          );
        },
      ),
    );
  }
}

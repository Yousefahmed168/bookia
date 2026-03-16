import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/my_body_view.dart';
import '../../../home/data/models/best_seller_books_response/product.dart';
import '../widgets/custom_back_button.dart';

class DetailsArg {}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomBackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomSvgPicture(path: AppImages.bookmarkSvg),
          ),
        ],
      ),
      body: MyBodyView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? '',
                  width: 180,
                  height: 270,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(11),
              Text(
                product.name ?? '',
                style: TextStyles.headline,
                textAlign: TextAlign.center,
              ),
              Gap(11),
              Text(
                product.category ?? '',
                style: TextStyles.caption1.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Gap(20),
              Text(
                product.description ?? '',
                textAlign: TextAlign.justify,
                style: TextStyles.caption2.copyWith(color: AppColors.darkColor),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${product.price} \$', style: TextStyles.title),
            MainButton(
              bgColor: AppColors.darkColor,
              minWidth: 200,
              text: 'Add to cart',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

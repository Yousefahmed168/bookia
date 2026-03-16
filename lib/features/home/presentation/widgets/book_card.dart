import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/functions/navigations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/main_button.dart';
import '../../data/models/best_seller_books_response/product.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.details, extra: product);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(10),
            SizedBox(
              height: 45,
              child: Text(
                product.name ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.body,
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${product.priceAfterDiscount}', style: TextStyles.body),
                SizedBox(
                  height: 30,
                  child: MainButton(
                    minWidth: 70,
                    minHeight: 30,
                    bgColor: AppColors.darkColor,
                    text: 'Buy',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

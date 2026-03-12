
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('The Republic', style: TextStyles.subtitle1),
        Gap(25),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹285',
                style: TextStyles.body.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(5),
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
        ),
      ],
    );
  }
}
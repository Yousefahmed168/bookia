import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/shimmer/grid_view_shimmer.dart';
import '../../../../core/widgets/shimmer/text_shimmer.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'book_card.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          var books = context.read<HomeCubit>().products;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('best_seller'.tr(), style: TextStyles.title),
              Gap(30),
              books.isEmpty
                  ? Center(child: Text('no_books_found'.tr()))
                  : GridView.builder(
                      itemCount: books.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11,
                        childAspectRatio: .6,
                      ),
                      itemBuilder: (context, index) {
                        return BookCard(product: books[index]);
                      },
                    ),
            ],
          );
        } else if (state is HomeErrorState) {
          return Center(child: Text(state.message));
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextShimmer(width: 100),
              Gap(20),
              GridShimmer(
                crossAxisCount: 2,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                childAspectRatio: .6,
              ),
            ],
          );
        }
      },
    );
  }
}

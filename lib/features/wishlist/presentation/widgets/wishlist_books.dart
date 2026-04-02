import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/shimmer/grid_view_shimmer.dart';
import '../../../home/presentation/widgets/book_card.dart';
import '../cubit/wishlist_cubit.dart';
import '../cubit/wishlist_state.dart';

class WishlistBooks extends StatelessWidget {
  const WishlistBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        var cubit = context.read<WishlistCubit>();
        if (state is WishlistSuccessState) {
          var books = cubit.products;
          if (books.isEmpty) {
            return Center(
              child: Text('no_books_wishlist'.tr(), style: TextStyles.title),
            );
          }
          return GridView.builder(
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
              childAspectRatio: .6,
            ),
            itemBuilder: (context, index) {
              return BookCard(
                product: books[index],
                onRemoveFromWishlist: () {
                  cubit.removeFromWishlist(books[index].id ?? 0);
                },
                onRefresh: () {
                  cubit.getWishlist();
                },
              );
            },
          );
        } else {
          return GridShimmer(
            crossAxisCount: 2,
            mainAxisSpacing: 11,
            crossAxisSpacing: 11,
            childAspectRatio: .6,
            itemCount: 4,
            shrinkWrap: false,
          );
        }
      },
    );
  }
}

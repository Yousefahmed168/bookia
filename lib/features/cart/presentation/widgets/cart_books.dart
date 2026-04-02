import '../../../../core/routes/navigations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/dialog.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/shimmer/list_view_shimmer.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';
import 'cart_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBooks extends StatelessWidget {
  const CartBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CheckoutLoadingState) {
          showLoadingDialog(context);
        } else if (state is CheckoutSuccessState) {
          Navigator.pop(context);
          var cubit = context.read<CartCubit>();
          pushTo(context, Routes.placeorder, extra: cubit.total);
        } else if (state is CheckoutErrorState) {
          Navigator.pop(context); // Close loading dialog
          showMyDialog(context, 'failed_checkout'.tr());
        }
      },
      buildWhen: (_, state) =>
          state is CartSuccessState ||
          state is CartErrorState ||
          state is CartLoadingState,
      builder: (context, state) {
        if (state is CartSuccessState) {
          var cubit = context.read<CartCubit>();
          if (cubit.products.isEmpty) {
            return Center(
              child: Text('no_books_cart'.tr(), style: TextStyles.title),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.products.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      item: cubit.products[index],
                      onRemove: () {
                        cubit.removeFromCart(cubit.products[index].itemId ?? 0);
                      },
                      onUpdate: (count) {
                        cubit.updateCart(
                          cubit.products[index].itemId ?? 0,
                          count,
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Text('total_with_value'.tr(args: [cubit.total.toString()]), style: TextStyles.subtitle2),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainButton(
                  onPressed: () {
                    cubit.checkout();
                  },
                  text: 'checkout'.tr(),
                ),
              ),
            ],
          );
        } else {
          return ListShimmer();
        }
      },
    );
  }
}

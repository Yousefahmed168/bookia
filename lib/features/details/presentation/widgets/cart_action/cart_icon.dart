import '../../../../../core/routes/navigations.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/dialog.dart';
import '../../../../../core/widgets/main_button.dart';
import 'cubit/cart_action_cubit.dart';
import 'cubit/cart_action_state.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/services/di/service_locator.dart';

class CartActionWidget extends StatelessWidget {
  const CartActionWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartActionCubit>(),
      child: BlocConsumer<CartActionCubit, CartActionState>(
        listener: (context, state) {
          if (state is CartActionSuccessState) {
            pop(context);
            context.read<CartCubit>().getCart();
            showMyDialog(context, state.msg, type: DialogType.success);
          } else if (state is CartActionErrorState) {
            pop(context);
            showMyDialog(context, 'something_went_wrong'.tr());
          } else if (state is CartActionLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<CartActionCubit>();
          bool isInCart = cubit.isProductInCart(id);
          return MainButton(
            bgColor: isInCart ? AppColors.primaryColor : AppColors.darkColor,
            minWidth: 200,
            text: isInCart ? 'added_to_cart'.tr() : 'add_to_cart'.tr(),
            onPressed: () {
              if (!cubit.isProductInCart(id)) {
                context.read<CartActionCubit>().addToCart(id);
              }
            },
          );
        },
      ),
    );
  }
}

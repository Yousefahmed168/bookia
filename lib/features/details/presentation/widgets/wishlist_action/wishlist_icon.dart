import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/routes/navigations.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_svg_picture.dart';
import '../../../../../core/widgets/dialog.dart';
import '../../../../../core/services/di/service_locator.dart';
import 'cubit/wishlist_action_cubit.dart';
import 'cubit/wishlist_icon_state.dart';

class WishlistActionWidget extends StatelessWidget {
  const WishlistActionWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WishlistActionCubit>(),
      child: BlocConsumer<WishlistActionCubit, WishlistActionState>(
        listener: (context, state) {
          if (state is WishlistActionSuccessState) {
            pop(context);
            showMyDialog(context, state.msg, type: DialogType.success);
          } else if (state is WishlistActionErrorState) {
            pop(context);
            showMyDialog(context, 'something_went_wrong'.tr());
          } else if (state is WishlistActionLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<WishlistActionCubit>();
          return IconButton(
            onPressed: () {
              if (cubit.isProductInWishlist(id)) {
                cubit.removeFromWishlist(id);
              } else {
                context.read<WishlistActionCubit>().addToWishlist(id);
              }
            },
            icon: cubit.isProductInWishlist(id)
                ? CustomSvgPicture(
                    path: AppImages.bookmarkSvg,
                    color: AppColors.primaryColor,
                  )
                : SvgPicture.asset(AppImages.bookmarkSvg),
          );
        },
      ),
    );
  }
}

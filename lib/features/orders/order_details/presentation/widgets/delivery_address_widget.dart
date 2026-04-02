import 'package:easy_localization/easy_localization.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/orders/order_details/data/models/order_details_response/data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key, required this.order});

  final Data order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("delivery_address".tr(), style: TextStyles.body),
        const Gap(12),
        Text(order.name ?? "No Name", style: TextStyles.body),
        const Gap(4),
        Text(
          "${order.address ?? ""}, ${order.governorate ?? ""}",
          style: TextStyles.body.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        const Gap(4),
        Text(
          order.phone ?? "",
          style: TextStyles.body.copyWith(
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}

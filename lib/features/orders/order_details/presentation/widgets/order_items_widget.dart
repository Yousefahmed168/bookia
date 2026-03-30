import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/orders/order_details/data/models/order_details_response/order_product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderItemsWidget extends StatelessWidget {
  const OrderItemsWidget({super.key, required this.products});

  final List<OrderProduct> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Order Items", style: TextStyles.body),
        const Gap(12),
        ...List.generate(products.length, (index) {
          final item = products[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.productName ?? "", style: TextStyles.caption1),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Qty: ${item.orderProductQuantity ?? 0}",
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                    Text(
                      "\$${item.productTotal ?? "0"}",
                      style: TextStyles.caption1,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/orders/order_details/data/models/order_details_response/data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderPaymentSummaryWidget extends StatelessWidget {
  const OrderPaymentSummaryWidget({super.key, required this.order});

  final Data order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("payment_summary".tr(), style: TextStyles.body),
        const Gap(16),
        _summaryRow(title: "sub_total".tr(), value: "\$${order.subTotal ?? "0"}"),
        const Gap(10),
        _summaryRow(title: "discount".tr(), value: "${order.discount ?? 0}"),
        const Gap(10),
        _summaryRow(
          title: "total".tr(),
          value: "\$${order.total ?? "0"}",
          isBold: true,
        ),
        const Gap(16),
        _summaryRow(title: "status".tr(), value: order.status ?? "Unknown"),
        const Gap(10),
        _summaryRow(title: "order_date".tr(), value: order.orderDate ?? ""),
      ],
    );
  }

  Widget _summaryRow({
    required String title,
    required String value,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: isBold ? TextStyles.body : TextStyles.caption1),
        Text(value, style: isBold ? TextStyles.body : TextStyles.caption1),
      ],
    );
  }
}

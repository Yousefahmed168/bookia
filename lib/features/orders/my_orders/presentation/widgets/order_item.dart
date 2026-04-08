import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String totalAmount;
  final Function()? onTap;
  const OrderItem({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.totalAmount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 140,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text("order_no".tr(args: [orderNumber]), style: TextStyles.body),
                ),
                Text(
                  date,
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'total_amount'.tr(),
                  style: TextStyles.body.copyWith(color: AppColors.greyColor),
                ),
                Text(totalAmount, style: TextStyles.body),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

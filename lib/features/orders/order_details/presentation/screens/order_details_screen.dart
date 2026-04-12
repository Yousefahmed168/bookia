import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/routes/navigations.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/dialog.dart';
import '../../../../../core/widgets/main_button.dart';
import '../cubit/order_details_cubit.dart';
import '../cubit/order_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../widgets/delivery_address_widget.dart';
import '../widgets/order_items_widget.dart';
import '../widgets/order_payment_summary_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.orderId});

  final int orderId;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool _isLoadingDialogShown = false;

  void _showLoader() {
    if (_isLoadingDialogShown) return;

    _isLoadingDialogShown = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      showLoadingDialog(context);
    });
  }

  void _hideLoader() {
    if (!_isLoadingDialogShown) return;

    _isLoadingDialogShown = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Navigator.of(context, rootNavigator: true).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CustomBackButton(),
        ),
        title: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            final orderCode =
                context
                    .read<OrderDetailsCubit>()
                    .orderDetailsResponse
                    ?.orderCode ??
                widget.orderId.toString();

            return Text("#$orderCode", style: TextStyles.body);
          },
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
        listener: (context, state) {
          if (state is OrderDetailsLoading) {
            _showLoader();
          } else if (state is OrderDetailsLoaded) {
            _hideLoader();
          } else if (state is OrderDetailsError) {
            _hideLoader();
            showMyDialog(context, state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<OrderDetailsCubit>();
          final order = cubit.orderDetailsResponse;

          if (state is OrderDetailsLoading && order == null) {
            return const SizedBox.shrink();
          }

          if (state is OrderDetailsError && order == null) {
            return Center(child: Text("failed_load_order_details".tr()));
          }

          if (order == null) {
            return const SizedBox.shrink();
          }

          final products = order.orderProducts ?? [];

          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                DeliveryAddressWidget(order: order),
                const Gap(16),
                const Divider(),
                const Gap(16),
                OrderItemsWidget(products: products),
                const Gap(8),
                const Divider(),
                const Gap(16),
                OrderPaymentSummaryWidget(order: order),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: MainButton(text: "my_orders".tr(), onPressed: () => pop(context)),
      ),
    );
  }
}

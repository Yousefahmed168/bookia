import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/routes/navigations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../../../../core/widgets/dialog.dart';
import '../cubit/my_order_cubit.dart';
import '../cubit/my_orders_state.dart';
import '../widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyOrderCubit>().getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my_orders".tr(), style: TextStyles.subtitle1),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset(AppImages.backSvg),
          onPressed: () => pop(context),
        ),
      ),
      body: BlocConsumer<MyOrderCubit, MyOrdersState>(
        listener: (context, state) {
          if (state is MyOrdersLoading) {
            showLoadingDialog(context);
          } else if (state is MyOrdersLoaded) {
            pop(context);
          } else if (state is MyOrdersError) {
            pop(context);
            showMyDialog(context, state.message);
          }
        },
        builder: (context, state) {
          var cubit = context.read<MyOrderCubit>();
          var orders = cubit.myOrdersResponse;

          if (orders != null && orders.isEmpty) {
            return Center(child: Text("no_orders_found".tr()));
          }

          if (orders != null) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return OrderItem(
                    orderNumber: orders[index].orderCode ?? "N/A",
                    date: orders[index].orderDate ?? "N/A",
                    totalAmount: "\$${orders[index].total ?? "0"}",
                    onTap: () {
                      pushTo(context, Routes.orderDetails, extra: orders[index].id);
                    },
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

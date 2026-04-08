import 'package:easy_localization/easy_localization.dart';
import '../cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/my_body_view.dart';
import '../widgets/cart_books.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(title: Text('cart'.tr())),
        body: MyBodyView(child: CartBooks()),
      ),
    );
  }
}

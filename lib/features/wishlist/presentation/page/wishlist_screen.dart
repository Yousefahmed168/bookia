import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/my_body_view.dart';
import '../cubit/wishlist_cubit.dart';
import '../widgets/wishlist_books.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('wishlist'.tr(), style: TextStyles.title),
      ),
      body: MyBodyView(
        child: BlocProvider(
          create: (context) => WishlistCubit()..getWishlist(),
          child: WishlistBooks(),
        ),
      ),
    );
  }
}

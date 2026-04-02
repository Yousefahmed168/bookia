import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'core/styles/themes.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: MaterialApp.router(
        routerConfig: AppRouter.routes,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        builder: (_, child) =>
            SafeArea(top: false, bottom: Platform.isAndroid, child: child!),
        theme: AppThemes.lightTheme,
      ),
    );
  }
}

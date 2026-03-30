import 'dart:developer';

import '../../core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constants/app_images.dart';
import '../../core/routes/navigations.dart';
import '../../core/services/local/shared_pref.dart';
import '../../core/styles/text_styles.dart';
import '../../core/widgets/custom_svg_picture.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    String? token = SharedPref.getToken();
    log(token.toString());

    Future.delayed(const Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        pushReplacement(context, Routes.mainappscreen);
      } else {
        pushReplacement(context, Routes.welcomescreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: AppImages.logoSvg, width: 250),
            Gap(10),
            Text('Order Your Book Now!', style: TextStyles.subtitle2),
          ],
        ),
      ),
    );
  }
}

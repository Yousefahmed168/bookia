import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constants/app_images.dart';
import '../../core/functions/navigations.dart';
import '../../core/styles/text_styles.dart';
import '../../core/widgets/custom_svg_picture.dart';
import '../intro/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(context, const WelcomeScreen());
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

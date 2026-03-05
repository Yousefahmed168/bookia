import '../auth/page/login_screen.dart.dart';
import '../auth/page/register_screen.dart';

import '../../core/constants/app_images.dart';
import '../../core/functions/navigations.dart';
import '../../core/styles/colors.dart';
import '../../core/styles/text_styles.dart';
import '../../core/widgets/custom_svg_picture.dart';
import '../../core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Positioned(
            top: 0,
            left: 22,
            right: 22,
            bottom: 0,
            child: Column(
              children: [
                Spacer(flex: 2),
                CustomSvgPicture(path: AppImages.logoSvg),
                Gap(15),
                Text('Order Your Book Now!', style: TextStyles.subtitle1),
                Spacer(flex: 4),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    pushTo(context, const LoginScreen());
                  },
                ),
                Gap(15),
                MainButton(
                  bgColor: AppColors.backgroundColor,
                  textColor: AppColors.darkColor,
                  borderColor: AppColors.darkColor,
                  text: 'Register',
                  onPressed: () {
                    pushTo(context, const RegisterScreen());
                  },
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

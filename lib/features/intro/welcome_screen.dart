import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constants/app_images.dart';
import '../../core/routes/navigations.dart';
import '../../core/routes/routes.dart' show Routes;
import '../../core/styles/colors.dart';
import '../../core/styles/text_styles.dart';
import '../../core/widgets/custom_svg_picture.dart';
import '../../core/widgets/main_button.dart';

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
                Text('order_now'.tr(), style: TextStyles.subtitle1),
                Spacer(flex: 4),
                MainButton(
                  text: 'login'.tr(),
                  onPressed: () {
                    pushTo(context, Routes.loginscreen);
                  },
                ),
                Gap(15),
                MainButton(
                  bgColor: AppColors.backgroundColor,
                  textColor: AppColors.darkColor,
                  borderColor: AppColors.darkColor,
                  text: 'register'.tr(),
                  onPressed: () {
                    pushTo(context, Routes.registerscreen);
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

// import 'package:bookia/core/constants/app_images.dart';
// import 'package:bookia/core/styles/colors.dart';
// import 'package:bookia/core/styles/text_styles.dart';
// import 'package:bookia/core/widgets/custom_svg_picture.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class SocialButton extends StatelessWidget {
//   const SocialButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: Divider(thickness: 1, color: AppColors.greyColor),
//             ),
//             Gap(20),
//             Text("Or", style: TextStyles.body),
//             Gap(20),
//             Expanded(
//               child: Divider(thickness: 1, color: AppColors.greyColor),
//             ),
//           ],
//         ),
//         Gap(20),
//         Container(
//           height: 50,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: AppColors.greyColor),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomSvgPicture(path: AppImages.googleSvg),
//               Gap(10),
//               Text("Continue with Google", style: TextStyles.body),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Gap(20),
            Text('OR', style: TextStyles.caption1),
            Gap(20),
            Expanded(child: Divider()),
          ],
        ),
        Gap(15),
        SocialButton(
          path: AppImages.googleSvg,
          text: 'Continue with Google',
          onTap: () {},
        ),
        Gap(15),
        SocialButton(
          path: AppImages.appleSvg,
          text: 'Continue with Apple',
          onTap: () {},
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.path,
    required this.text,
    required this.onTap,
  });
  final String path;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgPicture(path: path),
            Gap(10),
            Text(
              text,
              style: TextStyles.caption1.copyWith(
                color: AppColors.darkGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

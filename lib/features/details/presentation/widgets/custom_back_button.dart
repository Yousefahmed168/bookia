import '../../../../core/constants/app_images.dart';
import '../../../../core/functions/navigations.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => pop(context),
          child: CustomSvgPicture(path: AppImages.backSvg),
        ),
      ],
    );
  }
}

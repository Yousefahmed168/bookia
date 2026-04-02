import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routes/navigations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubit/auth_cubit.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AuthCubit(), child: const _SignUpView());
  }
}

class _SignUpView extends StatelessWidget {
  const _SignUpView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(200),
                        CustomSvgPicture(
                          path: AppImages.successSvg,
                          height: 100,
                          width: 100,
                        ),
                        const Gap(35),
                        Text(
                          'password_changed_title'.tr(),
                          style: TextStyles.title.copyWith(fontSize: 26),
                        ),
                        const Gap(3),
                        Text(
                          'password_changed_desc'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyles.body.copyWith(
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                        const Gap(40),
                        MainButton(
                          text: "back_to_login".tr(),
                          onPressed: () {
                            pushTo(context, Routes.loginscreen);
                          },
                        ),
                        const Gap(250),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

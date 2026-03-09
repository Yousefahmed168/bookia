import '../../../../core/constants/app_images.dart';
import '../../../../core/functions/navigations.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubit/auth_cubit.dart';
import 'login_screen.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
                          'Password Changed ',
                          style: TextStyles.title.copyWith(fontSize: 26),
                        ),
                        const Gap(3),
                        Text(
                          'Your password has been changed\n successfully.',
                          textAlign: TextAlign.center,
                          style: TextStyles.body.copyWith(
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                        const Gap(40),
                        MainButton(
                          text: "Back to Login",
                          onPressed: () {
                            pushTo(context, LoginScreen());
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

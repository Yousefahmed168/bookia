import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routes/navigations.dart';
import '../../../../core/functions/validations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/dialog.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () => pop(context),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CustomSvgPicture(path: AppImages.backSvg),
            ),
          ),
        ),

        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              log('success');
            } else if (state is AuthErrorState) {
              showMyDialog(context, state.message);
            } else if (state is AuthLoadingState) {
              showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Padding(
              padding: const EdgeInsets.all(22),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('forgot_password_title'.tr(), style: TextStyles.headline),
                    Gap(10),
                    Text(
                      'forgot_password_desc'.tr(),
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                    Gap(30),
                    CustomTextFormField(
                      hintText: 'email_hint'.tr(),
                      controller: cubit.emailController,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'please Enter Your Email';
                        } else if (!isEmailValid(input)) {
                          return 'Please Enter a Valid Email';
                        }
                        return null;
                      },
                    ),
                    Gap(40),

                    MainButton(
                      bgColor: AppColors.primaryColor,
                      text: 'send_code'.tr(),
                      textColor: AppColors.backgroundColor,
                      onPressed: () {
                        pushTo(context, Routes.otpverfication);
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.forgetpassword();
                        }
                      },
                    ),

                    Gap(361),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(22, 0, 22, 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("remember_password".tr(), style: TextStyles.body),
              GestureDetector(
                onTap: () => pushTo(context, Routes.loginscreen),
                child: Text(
                  "login".tr(),
                  style: TextStyles.body.copyWith(
                    color: AppColors.primaryColor,
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

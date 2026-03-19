import 'dart:developer';

import '../../../../core/routes/routes.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/functions/navigations.dart';
import '../../../../core/functions/validations.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/dialog.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
                    Text('Forgot Password?', style: TextStyles.headline),
                    Gap(10),
                    Text(
                      'Dont worry! It occurs. Please enter the email address linked with your account.',
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                    Gap(30),
                    CustomTextFormField(
                      hintText: 'Enter your email',
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
                      text: 'Send Code ',
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
              Text("Remember Password? ", style: TextStyles.body),
              GestureDetector(
                onTap: () => pushTo(context, Routes.loginscreen),
                child: Text(
                  "Login",
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

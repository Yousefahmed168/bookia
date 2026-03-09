import 'dart:developer';

import '../../../../core/widgets/dialog.dart';
import '../../../../core/widgets/my_body_view.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'forgot_password.dart';
import '../../../main/main_app_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/functions/navigations.dart';
import '../../../../core/functions/validations.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/password_text_form_field.dart';
import '../widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: CustomSvgPicture(path: AppImages.backSvg),
          ),
        ),
        body: _loginBody(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?', style: TextStyles.caption1),
              Gap(5),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Register',
                  style: TextStyles.caption1.copyWith(
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

  BlocConsumer<AuthCubit, AuthState> _loginBody() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pop(context);
          log("success");
        } else if (state is AuthErrorState) {
          pop(context);
          showErrorDialog(context, state.message);
        } else if (state is AuthLoadingState) {
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return MyBodyView(
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Welcome back! Glad to see you, Again!',
                    style: TextStyles.headline,
                  ),
                  Gap(32),
                  CustomTextFormField(
                    controller: cubit.emailController,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!isEmailValid(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  Gap(15),
                  PasswordTextFormField(
                    controller: cubit.passwordController,
                    hintText: 'Enter your password',
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          pushTo(context, ForgetPasswordScreen());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.caption1.copyWith(
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  MainButton(
                    text: 'Login',
                    onPressed: () {
                      pushReplacement(context, MainAppScreen());
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    },
                  ),
                  Gap(35),
                  SocialLoginButtons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

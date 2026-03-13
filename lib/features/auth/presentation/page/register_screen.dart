import '../../../main/main_app_screen.dart';

import '../../../../core/widgets/dialog.dart';
import '../../../../core/widgets/my_body_view.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
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
import 'login_screen.dart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
        body: _registerBody(),

        // bottom navigation bar
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(22, 0, 22, 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?  ", style: TextStyles.body),
              GestureDetector(
                onTap: () => pushTo(context, const LoginScreen()),
                child: Text(
                  "Login Now",
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

  BlocConsumer<AuthCubit, AuthState> _registerBody() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pushToBase(context, MainAppScreen());
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
            child: Column(
              children: [
                Text(
                  "Hello! Register to get started",
                  style: TextStyles.headline.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(30),
                CustomTextFormField(
                  controller: cubit.usernameController,
                  hintText: 'Username',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                Gap(15),

                CustomTextFormField(
                  controller: cubit.emailController,
                  hintText: 'Email',
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
                  hintText: 'Password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                Gap(15),
                PasswordTextFormField(
                  controller: cubit.passwordConfirmationController,
                  hintText: 'Confirmation password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your confirmation password';
                    }
                    return null;
                  },
                ),

                Gap(30),

                MainButton(
                  text: 'Register',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.register();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

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
import '../../../../core/widgets/my_body_view.dart';
import '../../../../core/widgets/password_text_form_field.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

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
              Text("already_have_account".tr(), style: TextStyles.body),
              GestureDetector(
                onTap: () => pushTo(context, Routes.loginscreen),
                child: Text(
                  "login_now".tr(),
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
          pushToBase(context, Routes.mainappscreen);
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, state.message);
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
                  "hello".tr(),
                  style: TextStyles.headline.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(30),
                CustomTextFormField(
                  controller: cubit.usernameController,
                  hintText: 'username_hint'.tr(),
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
                  hintText: 'email_hint'.tr(),
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
                  hintText: 'password_hint'.tr(),
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
                  hintText: 'confirm_password'.tr(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your confirmation password';
                    }
                    return null;
                  },
                ),

                Gap(30),

                MainButton(
                  text: 'register'.tr(),
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

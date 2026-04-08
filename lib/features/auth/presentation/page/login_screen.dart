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
import '../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(
        builder: (context) {
          var cubit = context.read<AuthCubit>();
          return BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                pop(context); // dismiss loading dialog
                pushToBase(context, Routes.mainappscreen);
              } else if (state is AuthErrorState) {
                pop(context);
                showMyDialog(context, state.message);
              } else if (state is AuthLoadingState) {
                showLoadingDialog(context);
              }
            },
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  title: GestureDetector(
                    onTap: () => pop(context),
                    child: CustomSvgPicture(path: AppImages.backSvg),
                  ),
                ),
                body: MyBodyView(
                  child: Form(
                    key: cubit.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'welcome_back'.tr(),
                            style: TextStyles.headline,
                          ),
                          Gap(32),
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
                          ),
                          Gap(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pushTo(context, Routes.forgetpassword);
                                },
                                child: Text(
                                  'forgot_password'.tr(),
                                  style: TextStyles.caption1.copyWith(
                                    color: AppColors.darkGreyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(30),
                          MainButton(
                            text: 'login'.tr(),
                            onPressed: () {
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
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('no_account'.tr(), style: TextStyles.caption1),
                      Gap(5),
                      GestureDetector(
                        onTap: () {
                          pushTo(context, Routes.registerscreen);
                        },
                        child: Text(
                          'register_now'.tr(),
                          style: TextStyles.caption1.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

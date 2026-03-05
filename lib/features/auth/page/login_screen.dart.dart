import '../../../core/constants/app_images.dart';
import '../../../core/functions/navigations.dart';
import '../../../core/functions/validations.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/widgets/custom_svg_picture.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/password_text_form_field.dart';
import 'register_screen.dart';
import '../widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => pop(context),
          child: CustomSvgPicture(path: AppImages.backSvg),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Text(
                "Welcome back! Glad \nto see you, Again!",
                style: TextStyles.headline.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(30),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: "Enter your email",
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
                controller: TextEditingController(),

                hintText: "Enter your password",
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => pushTo(context, const RegisterScreen()),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(30),

              MainButton(text: 'login', onPressed: () {}),
              Gap(20),
              SocialLoginButtons(),
            ],
          ),
        ),
      ),

      // bottom navigation bar
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(22, 0, 22, 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don’t have an account? ", style: TextStyles.body),
            GestureDetector(
              onTap: () => pushTo(context, const RegisterScreen()),
              child: Text(
                " Register Now",
                style: TextStyles.body.copyWith(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

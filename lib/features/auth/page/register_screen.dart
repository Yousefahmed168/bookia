import '../../../core/constants/app_images.dart';
import '../../../core/functions/navigations.dart';
import '../../../core/functions/validations.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/widgets/custom_svg_picture.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/password_text_form_field.dart';
import 'login_screen.dart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                "Hello! Register to get started",
                style: TextStyles.headline.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(30),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: "Username",
              ),
              Gap(15),

              CustomTextFormField(
                controller: TextEditingController(),
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
                controller: TextEditingController(),

                hintText: "Password",
              ),
              Gap(15),
              PasswordTextFormField(
                controller: TextEditingController(),

                hintText: "Confirm password",
              ),

              Gap(30),

              MainButton(text: 'Register', onPressed: () {}),
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
            Text("Already have an account?  ", style: TextStyles.body),
            GestureDetector(
              onTap: () => pushTo(context, const LoginScreen()),
              child: Text(
                "Login Now",
                style: TextStyles.body.copyWith(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

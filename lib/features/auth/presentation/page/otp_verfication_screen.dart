import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/functions/navigations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_svg_picture.dart';
import '../../../../core/widgets/dialog.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class OtpVerficationScreen extends StatelessWidget {
  const OtpVerficationScreen({super.key});

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
              showErrorDialog(context, state.message);
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
                    Text('OTP Verification', style: TextStyles.headline),
                    Gap(10),
                    Text(
                      'Enter the verification code we just sent on your email address.',
                      style: TextStyles.body.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                    Gap(35),
                    Center(
                      child: Pinput(
                        length: 6,
                        onCompleted: (pin) {},
                        closeKeyboardWhenCompleted: true,
                      ),
                    ),
                    Gap(35),
                    MainButton(
                      bgColor: AppColors.primaryColor,

                      text: 'Verify ',
                      textColor: AppColors.backgroundColor,
                      onPressed: () {
                        pushReplacement(context,  Routes.createnewpassword);
                        cubit.otpcode();
                      },
                    ),
                    Gap(340),
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
              Text("Didn’t received code?   ", style: TextStyles.body),
              GestureDetector(
                onTap: () => pushTo(context,  Routes.forgetpassword),
                child: Text(
                  "Resend",
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

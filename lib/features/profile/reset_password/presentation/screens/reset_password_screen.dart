import 'package:bookia/core/routes/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/profile/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:bookia/features/profile/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResetPasswordCubit>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CustomBackButton(),
        ),
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            pop(context); // close loading dialog
            pop(context); // pop back
          } else if (state is ResetPasswordError) {
            pop(context); // close loading dialog
            showMyDialog(context, state.message);
          } else if (state is ResetPasswordLoading) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New Password", style: TextStyles.headline),
                  const Gap(73),
                  PasswordTextFormField(
                    controller: cubit.currentPasswordController,
                    hintText: 'Enter your password',
                  ),
                  const Gap(26),
                  PasswordTextFormField(
                    controller: cubit.newPasswordController,
                    hintText: 'Enter your password',
                  ),
                  const Gap(26),
                  PasswordTextFormField(
                    controller: cubit.confirmPasswordController,
                    hintText: 'Enter your password',
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(
          text: "Update Password",
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.updatePassword();
            }
          },
        ),
      ),
    );
  }
}

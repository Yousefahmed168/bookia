import '../../domain/usecases/reset_password_use_case.dart';
import 'reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/reset_password_params.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetProfilePasswordUseCase resetProfilePasswordUseCase;

  ResetPasswordCubit(this.resetProfilePasswordUseCase)
      : super(ResetPasswordInitial());

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updatePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordLoading());
      var params = ResetPasswordParams(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        newPasswordConfirmation: confirmPasswordController.text,
      );
      var response = await resetProfilePasswordUseCase(params);

      response.fold(
        (l) => emit(ResetPasswordError(message: l.message)),
        (r) => emit(ResetPasswordSuccess(message: r.message ?? "Success")),
      );
    }
  }
}

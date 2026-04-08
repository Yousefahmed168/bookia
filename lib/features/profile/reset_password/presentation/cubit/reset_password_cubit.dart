
import '../../data/models/reset_password_params.dart';
import '../../data/repo/reset_password_repo.dart';
import 'reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final ResetPasswordParams params = ResetPasswordParams();

  Future<void> updatePassword() async {
    emit(ResetPasswordLoading());

    params.currentPassword = currentPasswordController.text;
    params.newPassword = newPasswordController.text;
    params.newPasswordConfirmation = confirmPasswordController.text;

    var response = await ResetPasswordRepo.updatePassword(params);

    response.fold(
      (l) => emit(ResetPasswordError(message: l.message)),
      (r) => emit(ResetPasswordSuccess(message: r.message ?? "Success")),
    );
  }
}

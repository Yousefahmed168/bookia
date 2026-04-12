import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:bookia/features/auth/domain/usecases/login_use_case.dart';
import 'package:bookia/features/auth/domain/usecases/otp_code_use_case.dart';
import 'package:bookia/features/auth/domain/usecases/register_use_case.dart';
import 'package:bookia/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.forgetPasswordUseCase,
    required this.otpcodeUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitialState());

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final OtpcodeUseCase otpcodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(AuthLoadingState());
    var response = await loginUseCase(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var response = await registerUseCase.call(
      AuthParams(
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    response.fold(
      (l) {
        emit(AuthErrorState(message: l.message));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> forgetpassword() async {
    emit(AuthLoadingState());
    var response = await forgetPasswordUseCase(
      AuthParams(email: emailController.text),
    );
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> otpcode() async {
    emit(AuthLoadingState());
    var response = await otpcodeUseCase(AuthParams());
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> resetpassword() async {
    emit(AuthLoadingState());
    var response = await resetPasswordUseCase(
      AuthParams(
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }
}

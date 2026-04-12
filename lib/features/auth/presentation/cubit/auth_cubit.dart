import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.login(
      RegisterParams(
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
    var response = await AuthRepo.register(
      RegisterParams(
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
    var response = await AuthRepo.forgetpassword(
      RegisterParams(email: emailController.text),
    );
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> otpcode() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.otpcode(RegisterParams());
    response.fold(
      (l) => emit(AuthErrorState(message: l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  Future<void> resetpassword() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.resetpassword(
      RegisterParams(
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

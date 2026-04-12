import 'dart:io';

import '../../../../core/services/local/shared_pref.dart';
import '../data/models/update_profile_params.dart';
import '../domain/usecases/profile_use_cases.dart';
import 'edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase editProfileUseCase;
  final LogoutUseCase logoutUseCase;

  EditProfileCubit({
    required this.editProfileUseCase,
    required this.logoutUseCase,
  }) : super(EditProfileInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String imageUrl = '';

  void loadInitData() {
    var profileData = SharedPref.getUserInfo();
    nameController.text = profileData?.name ?? '';
    phoneController.text = profileData?.phone ?? '';
    addressController.text = profileData?.address ?? '';
    imageUrl = profileData?.image ?? '';
    emit(EditProfileSuccess());
  }

  Future<void> updateProfile(File? image) async {
    emit(EditProfileLoading());
    var params = UpdateProfileParams(
      name: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      image: image,
    );
    var response = await editProfileUseCase(params);

    response.fold(
      (l) => emit(EditProfileError(message: l.message)),
      (r) => emit(EditProfileSuccess()),
    );
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    var response = await logoutUseCase();

    if (isClosed) return;

    response.fold(
      (l) => emit(LogoutErrorState(message: l.message)),
      (r) async {
        await SharedPref.removeData(SharedPref.kToken);
        await SharedPref.removeData(SharedPref.kUser);
        emit(LogoutSuccessState());
      },
    );
  }
}

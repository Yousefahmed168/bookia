class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileError extends EditProfileState {
  final String message;
  EditProfileError({required this.message});
}

class LogoutLoadingState extends EditProfileState {}

class LogoutSuccessState extends EditProfileState {}

class LogoutErrorState extends EditProfileState {
  final String message;
  LogoutErrorState({required this.message});
}

class UpdateProfileLoadingState extends EditProfileState {}

class UpdateProfileSuccessState extends EditProfileState {}

class UpdateProfileErrorState extends EditProfileState {
  final String message;
  UpdateProfileErrorState({required this.message});
}

import 'package:store/feature/auth/model/user_model.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserModel user;

  ProfileLoaded(this.user);
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

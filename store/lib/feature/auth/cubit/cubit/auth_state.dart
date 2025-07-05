import 'package:store/feature/auth/model/register_model.dart';

abstract class AuthState {}

class RegisterInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final RegisterData data;
  
  AuthSuccess(this.data);
}

class RegisterFailure extends AuthState {
  final String error;
  
  RegisterFailure(this.error);
}
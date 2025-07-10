import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/auth/cubit/cubit/auth_state.dart';
import 'package:store/feature/auth/model/response_model.dart';
import 'package:store/feature/auth/services/login_api.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthApi authData = AuthApi();

  AuthCubit() : super(AuthInitial());


  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    emit(AuthLoading());
    try {
      final ResponseModel response = await authData.register(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        password: password,
        profileImage: profileImage,
      );
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final ResponseModel response = await authData.login(
        email: email,
        password: password,
      );
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void reset() => emit(AuthInitial());
}

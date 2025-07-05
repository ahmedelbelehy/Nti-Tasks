
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/auth/cubit/cubit/auth_state.dart';
import 'package:store/feature/auth/services/login_api.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthData authData;
  
  AuthCubit(this.authData) : super(RegisterInitial());
  
  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
  }) async {
    try {
      emit(RegisterLoading());
      
      final result = await authData.register(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        password: password,
      );
      
      emit(AuthSuccess(result));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
  
  void reset() {
    emit(RegisterInitial());
  }
}
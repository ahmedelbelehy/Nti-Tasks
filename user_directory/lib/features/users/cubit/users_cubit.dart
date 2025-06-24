import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/user_repository.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  Future<void> fetchUsers() async {
    emit(UsersLoading());
    try {
      final users = await UserRepository().fetchUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }
}

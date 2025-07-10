import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/profile/cubit/cubit/profile_state.dart';
import 'package:store/feature/profile/services/profile_services.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final ProfileServices profileServices = ProfileServices();
  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final userData = await profileServices.getProfile();
      emit(ProfileLoaded(userData));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}

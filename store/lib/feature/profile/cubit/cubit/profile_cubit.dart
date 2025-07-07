import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/profile/cubit/cubit/profile_state.dart';
import 'package:store/feature/profile/services/profile_services.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    try {
      final profileData = await ProfileServices().getProfile();
      emit(ProfileLoaded(profileData));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}

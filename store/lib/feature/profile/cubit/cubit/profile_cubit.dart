import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/profile/cubit/cubit/profile_state.dart';
import 'package:store/feature/profile/model/user_profile_response.dart';
import 'package:store/core/helper/cash_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


UserProfileResponse? currentUser;
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String gender = "male";
  String token = "";

  Future<void> getProfile(String token) async {
    emit(ProfileLoading());
    this.token = token;

    try {
      final response = await Dio().post(
        "https://elwekala.onrender.com/user/profile",
        data: {"token": token},
      );

      if (response.data['status'] == "success") {
        final userProfile = UserProfileResponse.fromJson(response.data);

        currentUser = userProfile;

        nameController.text = userProfile.name ?? "";
        emailController.text = userProfile.email ?? "";
        phoneController.text = userProfile.phone ?? "";
        gender = userProfile.gender ?? "male";

        emit(ProfileLoaded(userProfile));
      } else {
        emit(ProfileError("فشل في تحميل البيانات"));
      }
    } catch (e) {
      emit(ProfileError("حدث خطأ ما: ${e.toString()}"));
    }
  }

  Future<void> updateProfile() async {
    emit(ProfileLoading());

    try {
      final response = await Dio().put(
        "https://elwekala.onrender.com/user/update",
        data: {
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": phoneController.text.trim(),
          "gender": gender,
          "password": "12345678",
          "nationalId": currentUser?.nationalId ?? "",
          "token": token,
        },
      );

      if (response.data['status'] == "success") {
        await getProfile(token);
      } else {
        emit(ProfileError("فشل في تحديث البيانات"));
      }
    } catch (e) {
      emit(ProfileError("حدث خطأ أثناء التحديث: ${e.toString()}"));
    }
  }

  Future<void> deleteUser() async {
    emit(ProfileLoading());

    try {
      final response = await Dio().delete(
        "https://elwekala.onrender.com/user/delete",
        data: {
          "token": token,
          "email": emailController.text.trim(),
        },
      );

      if (response.data['status'] == "success") {
        await CashSharedHelper.removeData(key: 'token');
        emit(ProfileInitial());
      } else {
        emit(ProfileError("فشل في حذف الحساب"));
      }
    } catch (e) {
      emit(ProfileError("حدث خطأ أثناء الحذف: ${e.toString()}"));
    }
  }
}


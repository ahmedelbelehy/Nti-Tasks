// Updated ProfileServices.dart with correct logic, proper separation of concerns
// and integration with ProfileCubit where needed

import 'package:dio/dio.dart';
import 'package:store/core/helper/cash_helper.dart';
import 'package:store/feature/auth/model/user_model.dart';

class ProfileServices {
  final Dio dio = Dio();

  Future<UserModel> getProfile() async {
    final token = CashSharedHelper.getData(key: 'token');

    if (token == null || token.isEmpty) {
      throw Exception("Your account not found, login again");
    }

    final response = await dio.post(
      "https://elwekala.onrender.com/user/profile",
      data: {"token": token},
    );

    final userData = response.data['user'];
    return UserModel.fromJson(userData);
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String nationalId,
  }) async {
    final token = CashSharedHelper.getData(key: 'token');

    if (token == null || token.isEmpty) {
      throw Exception("Access token not found");
    }

    final response = await dio.put(
      "https://elwekala.onrender.com/user/update",
      data: {
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender,
        "password": password,
        "nationalId": nationalId,
        "token": token,
      },
    );

    if (response.data['status'] != 'success') {
      throw Exception("Failed to update profile");
    }
  }

  Future<void> deleteProfile() async {
    final token = CashSharedHelper.getData(key: 'token');

    if (token == null || token.isEmpty) {
      throw Exception("Access token not found");
    }

    final response = await dio.delete(
      "https://elwekala.onrender.com/user/delete",
      data: {
        "token": token,
        "email": CashSharedHelper.getData(key: 'email') ?? "",
      },
    );

    if (response.statusCode != 200 || response.data['status'] != 'success') {
      throw Exception("Delete failed: ${response.data.toString()}");
    }

    await CashSharedHelper.removeData(key: 'token');
    await CashSharedHelper.removeData(key: 'email');
  }
}

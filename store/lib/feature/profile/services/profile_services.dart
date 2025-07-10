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
    required String email,
    required String password,
    String? name,
    String? phone,
    String? gender,
    String? nationalId,
  }) async {
    final token = CashSharedHelper.getData(key: 'token');

    if (token == null || token.isEmpty) {
      throw Exception("Access token not found");
    }

    final url = 'https://elwekala.onrender.com/user/update';

    final data = <String, dynamic>{'email': email, 'password': password};
    if (name != null) data['name'] = name;
    if (phone != null) data['phone'] = phone;
    if (gender != null) data['gender'] = gender;
    if (nationalId != null) data['nationalId'] = nationalId;

    final response = await dio.put(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
      data: data,
    );

    if (response.statusCode != 200) {
      throw Exception("Update failed: ${response.data.toString()}");
    }
  }

  Future<void> deleteProfile() async {
    final token = CashSharedHelper.getData(key: 'token');

    if (token == null || token.isEmpty) {
      throw Exception("Access token not found");
    }

    final url = 'https://elwekala.onrender.com/user/delete';

    final response = await dio.delete(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception("Delete failed: ${response.data.toString()}");
    }

    await CashSharedHelper.removeData(key: 'token');
  }
}

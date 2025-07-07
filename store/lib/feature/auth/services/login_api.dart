import 'package:dio/dio.dart';
import 'package:store/core/helper/cash_helper.dart';
import 'package:store/feature/auth/model/response_model.dart';

class AuthData {
  final CashSharedHelper cashHelper = CashSharedHelper();
  final Dio dio = Dio();
  final String baseUrl = 'https://elwekala.onrender.com/user';

  Future<ResponseModel> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    try {
      final response = await dio.post(
        '$baseUrl/register',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'national_id': nationalId,
          'gender': gender,
          'password': password,
          'profile_image': profileImage,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final model = ResponseModel.fromJson(data);

        if (model.user?.token != null && model.user!.token!.isNotEmpty) {
          await cashHelper.saveData(key: "token", value: model.user!.token!);
        }

        return model;
      } else {
        throw Exception('Failed to register: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '$baseUrl/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final model = ResponseModel.fromJson(data);

        if (model.user?.token != null && model.user!.token!.isNotEmpty) {
          await cashHelper.saveData(key: "token", value: model.user!.token!);
        }

        return model;
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}

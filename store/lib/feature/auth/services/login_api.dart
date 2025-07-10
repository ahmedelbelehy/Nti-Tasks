import 'package:dio/dio.dart';
import 'package:store/core/helper/cash_helper.dart';
import 'package:store/feature/auth/model/response_model.dart';

class AuthApi {
  final Dio dio = Dio();

  Future<ResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String nationalId,
    required String gender,
    required String profileImage,
  }) async {
    try {
      final response = await dio.post(
        "https://elwekala.onrender.com/user/register",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
          "nationalId": nationalId,
          "gender": gender,
          "profileImage": profileImage,
        },
      );

      final data = response.data;
      final model = ResponseModel.fromJson(data);

      final token = model.user?.token;
      if (token != null && token.isNotEmpty) {
        await CashSharedHelper.saveData(key: "token", value: token);
        print("Token saved after register: $token");
      }

      return model;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        try {
          return ResponseModel.fromJson(e.response!.data);
        } catch (_) {
          throw Exception("Failed to parse error response.");
        }
      }
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "https://elwekala.onrender.com/user/login",
        data: {"email": email, "password": password},
      );

      final data = response.data;
      final model = ResponseModel.fromJson(data);

      final token = model.user?.token;
      if (token != null && token.isNotEmpty) {
        await CashSharedHelper.saveData(key: "token", value: token);
        print("Token saved after login: $token");
      }

      return model;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        try {
          return ResponseModel.fromJson(e.response!.data);
        } catch (_) {
          throw Exception("Failed to parse error response.");
        }
      }
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}

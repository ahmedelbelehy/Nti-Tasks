import 'package:dio/dio.dart';
import '../model/register_model.dart';

class AuthData {
  Dio dio = Dio();

  Future<RegisterData> register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
  }) async {
    final response = await dio.post(
      'https://elwekala.onrender.com/user/register',
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'national_id': nationalId,
        'gender': gender,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return RegisterData.fromJson(response.data);
    } else {
      throw Exception('Failed to register user');
    }
  }
}

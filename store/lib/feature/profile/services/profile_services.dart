import 'package:dio/dio.dart';
import 'package:store/core/helper/cash_helper.dart';
import 'package:store/feature/auth/model/user_model.dart';

class ProfileServices {
  final CashSharedHelper cashHelper = CashSharedHelper();
  final Dio dio = Dio();

  Future<UserModel> getProfile() async {
    try {
      final UserModel? token = cashHelper.getData(key: "token");
      if (token == null) {
        throw Exception("Token is missing. Make sure it is saved after login.");
      }

      final response = await dio.post(
        "https://elwekala.onrender.com/user/profile",
        data: {
          "token": token,
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data["user"]);
      } else {
        throw Exception('Failed to get profile: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}

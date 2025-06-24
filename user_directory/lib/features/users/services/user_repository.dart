import 'package:dio/dio.dart';
import '../model/user_model.dart';

class UserRepository {
  final Dio dio = Dio();

  Future<List<User>> fetchUsers() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/users');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((user) => User.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:store/modle1/laptop_model.dart';

class FavoriteApi {
  final Dio dio = Dio();
  final String url = "https://elwekala.onrender.com/favorite";

  Future<List<LaptopModel>> fetchFavorites() async {
    final response = await dio.get(url, data: {'nationalId': "01009876567876"});

    if (response.statusCode == 200) {
      final data = response.data['favoriteProducts'] as List<dynamic>;
      return data.map((json) => LaptopModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load favorites");
    }
  }

  Future<void> addFavorite({required String productId}) async {
    final body = {"nationalId": "01009876567876", "productId": productId};
    final response = await dio.post(url, data: body);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Failed to add favorite");
    }
  }

  Future<void> removeFavorite({required String productId}) async {
    final response = await dio.delete(
      url,
      data: {"nationalId": "01009876567876", "productId": productId},
    );
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception("Failed to remove favorite");
    }
  }
}

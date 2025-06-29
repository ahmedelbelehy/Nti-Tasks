import 'package:dio/dio.dart';
import 'package:store/feature/laptop_page/model/laptop_model.dart';

class LaptopApi {
  final Dio dio = Dio();
  final String url = "https://elwekala.onrender.com/product/Laptops";

  Future<List<LaptopModel>> fetchLaptops() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data['product'] as List<dynamic>;
        return data.map((json) => LaptopModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load laptops");
      }
    } catch (e) {
      throw Exception("Error fetching laptops: $e");
    }
  }
}

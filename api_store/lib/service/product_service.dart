import 'package:dio/dio.dart';
import '../product_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts(String categoryUrl) async {
    final response = await _dio.get(categoryUrl);
    if (response.statusCode == 200) {
      List data = response.data;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

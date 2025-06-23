import 'package:dio/dio.dart';
import '../model/product_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts(String category) async {
    final response = await _dio.get("https://fakestoreapi.com/products/category/$category");
    if (response.statusCode == 200) {
      List data = response.data;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

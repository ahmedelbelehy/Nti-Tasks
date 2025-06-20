import 'package:dio/dio.dart';
import '../features/product/domain/entities/product.dart';
import '../features/product/data/models/product_model.dart';

final Dio dio = Dio();
const String baseUrl = 'https://fakestoreapi.com/products/category/jewelery';

Future<List<Product>> fetchProducts() async {
  try {
    final response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      final List data = response.data;
      return data.map<Product>((item) => ProductModel.fromJson(item)).toList();
    }
    throw Exception(
      'Failed to load products: Unexpected status code ${response.statusCode}',
    );
  } on DioException catch (e) {
    throw Exception('Failed to load products: $e');
  }
}

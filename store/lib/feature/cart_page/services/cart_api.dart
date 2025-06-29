import 'package:dio/dio.dart';
import 'package:store/feature/laptop_page/model/laptop_model.dart';

class CartApi {
  final Dio dio = Dio();
  final String addUrl = "https://elwekala.onrender.com/cart/add";
  final String getAllUrl = "https://elwekala.onrender.com/cart/allProducts";

  Future<void> addToCart({required String productId}) async {
    final body = {
      "nationalId": "01026524572123",
      "productId": productId,
      "quantity": 1,
    };

    try {
      final response = await dio.post(addUrl, data: body);

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(
          "Failed to add product to cart: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Error adding product to cart: $e");
    }
  }

  Future<List<LaptopModel>> getAllCartProducts() async {
    try {
      final response = await dio.get(
        getAllUrl,
        data: {"nationalId": "01026524572123"},
      );

      if (response.statusCode == 200) {
        final data = response.data['products'] as List<dynamic>;

        return data.map((json) {
          final productJson = json['product'] ?? json;
          return LaptopModel.fromJson(productJson);
        }).toList();
      } else {
        throw Exception("Failed to get cart products: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching cart products: $e");
    }
  }

  Future<void> removeFromCart({required String productId}) async {
    final body = {"nationalId": "01026524572123", "productId": productId};

    try {
      final response = await dio.delete(
        "https://elwekala.onrender.com/cart/delete",
        data: body,
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(
          "Failed to remove product from cart: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Error removing product from cart: $e");
    }
  }

  Future<void> updateFromCart({
    required String productId,
    required int quantity,
  }) async {
    final body = {
      "nationalId": "01026524572123",
      "productId": productId,
      "quantity": quantity,
    };

    try {
      final response = await dio.put(
        "https://elwekala.onrender.com/cart",
        data: body,
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(
          "Failed to update product in cart: ${response.statusCode}",
        );
      }
    } catch (e) {
      throw Exception("Error updating product in cart: $e");
    }
  }
}

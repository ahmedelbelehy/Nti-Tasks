import 'package:dio/dio.dart';
import 'package:recipit_app/feature/home/model/recipit_model.dart';

final Dio dio = Dio();
final String baseUrl = 'https://dummyjson.com/recipes';

Future<RecipeListModel> getRecipes() async {
  try {
    final response = await dio.get(baseUrl);
    // Pass the entire response data to the factory constructor
    return RecipeListModel.fromJson(response.data);
  } catch (e) {
    throw Exception(e);
  }
}
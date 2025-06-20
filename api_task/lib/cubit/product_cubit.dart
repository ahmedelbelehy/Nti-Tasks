

import 'package:api_task/features/product/domain/entities/product.dart';
import 'package:api_task/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await fetchProductsFromApi();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}

Future<List<Product>> fetchProductsFromApi() async {
  return await fetchProducts();
}

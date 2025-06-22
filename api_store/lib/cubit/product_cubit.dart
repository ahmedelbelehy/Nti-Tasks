import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/product_service.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService _service;
  ProductCubit(this._service) : super(ProductInitial());

  final electronicsUrl =
      'https://fakestoreapi.com/products/category/electronics';
  final jeweleryUrl = 'https://fakestoreapi.com/products/category/jewelery';
  final mensClothingUrl =
      "https://fakestoreapi.com/products/category/men's%20clothing";
  final womensClothingUrl =
      "https://fakestoreapi.com/products/category/women's%20clothing";

  Future<void> fetchAll() async {
    emit(ProductLoading());
    try {
      final electronics = await _service.fetchProducts(electronicsUrl);
      final jewelery = await _service.fetchProducts(jeweleryUrl);
      final mensClothing = await _service.fetchProducts(mensClothingUrl);
      final womensClothing = await _service.fetchProducts(womensClothingUrl);
      emit(
        ProductLoaded(
          electronics: electronics,
          jewelery: jewelery,
          mensClothing: mensClothing,
          womensClothing: womensClothing,
        ),
      );
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/product_service.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService _service;
  ProductCubit(this._service) : super(ProductInitial());

  Future<void> fetchAll() async {
    emit(ProductLoading());
    try {
      final electronics = await _service.fetchProducts('electronics');
      final jewelery = await _service.fetchProducts('jewelery');
      final mensClothing = await _service.fetchProducts("men's%20clothing");
      final womensClothing = await _service.fetchProducts("women's%20clothing");
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

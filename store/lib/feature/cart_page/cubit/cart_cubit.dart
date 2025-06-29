import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/cart_api.dart';
import '../../laptop_page/model/laptop_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<LaptopModel> items;
  CartLoaded(this.items);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartCubit extends Cubit<CartState> {
  final CartApi cartApi = CartApi();
  CartCubit() : super(CartInitial());

  void getCartProducts() async {
    emit(CartLoading());
    try {
      final cartData = await cartApi.getAllCartProducts();
      emit(CartLoaded(cartData));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addToCart({required String productId}) async {
    try {
      await cartApi.addToCart(productId: productId);
      getCartProducts();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> removeFromCart({required String productId}) async {
    try {
      await cartApi.removeFromCart(productId: productId);
      getCartProducts();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> updateFromCart({
    required String productId,
    required int quantity,
  }) async {
    try {
      await cartApi.updateFromCart(productId: productId, quantity: quantity);
      getCartProducts();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}

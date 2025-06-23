import '../model/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> electronics;
  final List<Product> jewelery;
  final List<Product> mensClothing;
  final List<Product> womensClothing;

  ProductLoaded({
    required this.electronics,
    required this.jewelery,
    required this.mensClothing,
    required this.womensClothing,
  });
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

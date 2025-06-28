

import 'package:store/modle1/laptop_model.dart';

abstract class LaptopState {}

class LaptopInitial extends LaptopState {}

class LaptopLoading extends LaptopState {}

class LaptopLoaded extends LaptopState {
  final List<LaptopModel> laptops;
  LaptopLoaded(this.laptops);
}

class LaptopError extends LaptopState {
  final String message;
  LaptopError(this.message);
}

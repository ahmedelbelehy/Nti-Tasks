import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/laptop_api.dart';
import 'laptop_state.dart';

class LaptopCubit extends Cubit<LaptopState> {
  final LaptopApi laptopApi = LaptopApi();

  LaptopCubit() : super(LaptopInitial());

  void getLaptops() async {
    emit(LaptopLoading());
    try {
      final laptops = await laptopApi.fetchLaptops();
      emit(LaptopLoaded(laptops));
    } catch (e) {
      emit(LaptopError(e.toString()));
    }
  }
}

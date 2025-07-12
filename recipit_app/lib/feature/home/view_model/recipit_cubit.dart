import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipit_app/feature/home/services/recipit_services.dart';
import 'package:recipit_app/feature/home/view_model/recipit_state.dart';

class RecipitCubit extends Cubit<RecipitState> {
  RecipitCubit() : super(RecipitInitial());

  Future<void> getRecipts() async {
    try {
      emit(RecipitLoading());
      final recipits = await getRecipes();
      emit(RecipitLoaded(recipeListModel: recipits));
    } catch (e) {
      emit(RecipitError(errorMessage: e.toString()));
    }
  }
}

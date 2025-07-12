import 'package:recipit_app/feature/home/model/recipit_model.dart';

sealed class RecipitState {}

final class RecipitInitial extends RecipitState {}

final class RecipitLoading extends RecipitState {}

final class RecipitLoaded extends RecipitState {
  final RecipeListModel recipeListModel;

  RecipitLoaded({required this.recipeListModel});
}

final class RecipitError extends RecipitState {
  final String errorMessage;

  RecipitError({required this.errorMessage});
}

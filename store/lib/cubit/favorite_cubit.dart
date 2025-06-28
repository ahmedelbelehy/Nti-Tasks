import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/favorite_api.dart';
import '../modle1/laptop_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<LaptopModel> favorites;
  FavoriteLoaded(this.favorites);
}

class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteApi favoriteApi;
  FavoriteCubit(this.favoriteApi) : super(FavoriteInitial());

  void getFavorites(String nationalId) async {
    emit(FavoriteLoading());
    try {
      final favorites = await favoriteApi.fetchFavorites();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> addFavorite(String productId) async {
    emit(FavoriteLoading());

    try {
      await favoriteApi.addFavorite(productId: productId);
      final favorites = await favoriteApi.fetchFavorites();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> removeFromFavorites(String productId) async {
    emit(FavoriteLoading());
    try {
      await favoriteApi.removeFavorite(productId: productId);
      final favorites = await favoriteApi.fetchFavorites();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}

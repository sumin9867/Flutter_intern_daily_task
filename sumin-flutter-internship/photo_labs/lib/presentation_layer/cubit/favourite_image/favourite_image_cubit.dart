import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/domain_layer/domain_repositary/favourite_repositary.dart';
import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';
import 'package:photo_labs/presentation_layer/cubit/favourite_image/favourite_image_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepository repository;

  FavouriteCubit({required this.repository}) : super(FavouriteLoading());

  Future<void> loadFavorites() async {
    emit(FavouriteLoading());
    try {
      final favorites = await repository.loadFavorites();
      emit(FavouriteLoaded(favourites: favorites));
    } catch (e) {
      emit(FavouriteError('Failed to load favorites: $e'));
    }
  }

  Future<void> toggleFavorite(PhotoDetailEntity photo) async {
    if (state is FavouriteLoaded) {
      try {
        await repository.toggeledImages(photo);
        final updatedFavorites = await repository.loadFavorites();
        emit(FavouriteLoaded(favourites: updatedFavorites));
      } catch (e) {
        emit(FavouriteError('Failed to toggle favorite: $e'));
      }
    }
  }

  Future<void> deleteFavorite(PhotoDetailEntity photo) async {
    if (state is FavouriteLoaded) {
      try {
        await repository.deleteFavouriteImages(photo);
        final updatedFavorites = await repository.loadFavorites();
        emit(FavouriteLoaded(favourites: updatedFavorites));
      } catch (e) {
        emit(FavouriteError('Failed to delete favorite: $e'));
      }
    }
  }

  Future<void> saveFavorite(List<PhotoDetailEntity> favorites) async {
    if (state is FavouriteLoaded) {
      try {
        await repository.saveFavouriteImage(favorites);
        emit(FavouriteLoaded(favourites: favorites));
      } catch (e) {
        emit(FavouriteError('Failed to save favorites: $e'));
      }
    }
  }
}

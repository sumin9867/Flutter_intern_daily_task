import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/movie_params.dart';
import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';
import 'package:photo_labs/domain_layer/usecases/get_photos_detail.dart';
import 'package:photo_labs/presentation_layer/cubit/photo_detail_cubit/photo_detail_state.dart';

class PhotoDetailCubit extends Cubit<PhotoDetailState> {
  final GetDetailPhoto detailPhoto;

  PhotoDetailCubit(this.detailPhoto) : super(PhotoDetailInitial());

  Future<void> getMovieDetailById(String id) async {
    try {
      final Either<AppError, PhotoDetailEntity> eitherResponse =
          await detailPhoto(PhotoParams(id));

      eitherResponse.fold(
        (error) {
          emit(PhotoDetailError());
        },
        (photoDetail) {
          emit(PhotoDetailLoaded(photoDetailEntity: photoDetail));
        },
      );
    } catch (e) {
      emit(PhotoDetailError());
    }
  }
}

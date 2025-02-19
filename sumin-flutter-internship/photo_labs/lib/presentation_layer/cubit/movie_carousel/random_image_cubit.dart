import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/domain_layer/entity/no_params.dart';
import 'package:photo_labs/domain_layer/usecases/get_random_images.dart';
import 'package:photo_labs/presentation_layer/cubit/movie_carousel/random_iamge_state.dart';

class PhotoCarouselCubit extends Cubit<PhotoCarouselState> {
  PhotoCarouselCubit(this.getRandomImages)
      : super(const PhotoCarouselInitial());

  final GetRandomImages getRandomImages;

  Future<void> getImages(int index) async {
    final moviesEither = await getRandomImages(NoParams());
    moviesEither.fold(
      (l) {
        emit(const PhotoCarouselError());
      },
      (photos) {
        emit(PhotoCarouselLoaded(
          index,
          photos: photos,
          defaultIndex: state.index,
        ));
      },
    );
  }
}

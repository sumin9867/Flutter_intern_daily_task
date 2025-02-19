import 'package:bloc/bloc.dart';
import 'package:photo_labs/domain_layer/entity/no_params.dart';

import 'package:photo_labs/domain_layer/usecases/get_photo_list.dart';
import 'package:photo_labs/presentation_layer/cubit/photo_list_cubit/photo_list_state.dart';

class PhotoListCubit extends Cubit<PhotoListState> {
  GetPhotosList getPhotosList;
  PhotoListCubit(
    this.getPhotosList,
  ) : super(PhotoListInitial());

  Future<void> getPhotoList() async {
    try {
      final photoEither = await getPhotosList(NoParams());
      photoEither.fold(
        (failure) => emit(PhotoListError()),
        (photos) => emit(PhotoListLoaded(photos: photos)),
      );
    } catch (e) {
      emit(PhotoListError());
    }
  }
}

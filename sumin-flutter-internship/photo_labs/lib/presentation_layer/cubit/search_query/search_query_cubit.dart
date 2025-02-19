import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';
import 'package:photo_labs/domain_layer/entity/photo_search_params.dart';
import 'package:photo_labs/domain_layer/usecases/get_search_photo.dart';
import 'package:photo_labs/presentation_layer/cubit/search_query/search_query_state.dart';

class SearchQueryCubit extends Cubit<SearchQueryState> {
  final SearchPhoto searchPhoto;

  SearchQueryCubit({required this.searchPhoto}) : super(SearchQueryInitial());

  Future<void> searchImages(String query) async {
    if (query.length > 2) {
      final Either<AppError, List<PhotoListEntity>> response =
          await searchPhoto(MovieSearchParams(query));

      response.fold((l) => emit(SearchQueryError()),
          (r) => emit(SearchQueryLoaded(photos: r)));
    }
  }
}

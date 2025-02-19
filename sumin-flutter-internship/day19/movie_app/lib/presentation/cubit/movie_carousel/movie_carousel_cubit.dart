import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/use_cases/get_trending.dart';
import 'package:movie_app/presentation/cubit/movie_carousel/movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  MovieCarouselCubit(
    this.getTrending,
  ) : super(const MovieCarouselInitial());

  final GetTrending getTrending;

  Future<void> getMovie(int index) async {
    final moviesEither = await getTrending(NoParams());
    moviesEither.fold(
      (l) {
        emit(const MovieCarouselError());
      },
      (movies) {
        emit(MovieCarouselLoaded(
          index,
          movies: movies,
          defaultIndex: state.index,
        ));
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/use_cases/get_commingsoon.dart';
import 'package:movie_app/domain/use_cases/get_playingnow.dart';
import 'package:movie_app/domain/use_cases/get_popular.dart';
import 'package:movie_app/presentation/cubit/movie_tab_cubit/movie_tab_state.dart';

class MovieTabCubit extends Cubit<MovieTabState> {
  final GetPopular getPopular;
  final GetCommingSoon getComingSoon;
  final GetPlayingNow getPlayingNow;

  MovieTabCubit({
    required this.getPopular,
    required this.getComingSoon,
    required this.getPlayingNow,
  }) : super(MovieTabInitial());

  Future<void> getTabChanged(int i) async {
    Either<AppError, List<MovieEntity>>? moviesEither;
    switch (i) {
      case 0:
        moviesEither = await getPopular(NoParams());
        break;
      case 1:
        moviesEither = await getComingSoon(NoParams());
        break;
      case 2:
        moviesEither = await getPlayingNow(NoParams());
        break;
    }

    moviesEither?.fold(
      (l) => emit(MovieTabError(currentTabIndex: i)),
      (movies) => emit(
        MovieTabChanged(
          movies: movies,
          currentTabIndex: i,
        ),
      ),
    );
  }
}

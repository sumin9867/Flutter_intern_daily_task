import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_source/movie_local_data_source.dart';
import 'package:movie_app/data/data_source/movie_remote_data_impl.dart';
import 'package:movie_app/data/repositary/movie_remote_data.dart';
import 'package:movie_app/data/repositary/movie_repo_impl.dart';
import 'package:movie_app/domain/repositary/movies_repo.dart';
import 'package:movie_app/domain/use_cases/check_if_favourite.dart';
import 'package:movie_app/domain/use_cases/delete_movies.local.dart';
import 'package:movie_app/domain/use_cases/get_castdetail.dart';
import 'package:movie_app/domain/use_cases/get_commingsoon.dart';
import 'package:movie_app/domain/use_cases/get_movie_detail.dart';
import 'package:movie_app/domain/use_cases/get_favourite_movies.dart';
import 'package:movie_app/domain/use_cases/get_playingnow.dart';
import 'package:movie_app/domain/use_cases/get_popular.dart';
import 'package:movie_app/domain/use_cases/get_trending.dart';
import 'package:movie_app/domain/use_cases/save_movie_local.dart';
import 'package:movie_app/domain/use_cases/search_movies.dart';
import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_carousel/movie_carousel_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_tab_cubit/movie_tab_cubit.dart';

final getItInstance = GetIt.I;

Future setupDependencies() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(
      () => ApiClient(getItInstance<Client>()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance<ApiClient>()));
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());
  getItInstance.registerLazySingleton<MovieRepositary>(() => MovieRepoImplement(
      movieRemoteDataSource: getItInstance<MovieRemoteDataSource>(),
      movieLocalDataSource: getItInstance<MovieLocalDataSource>()));

  // usecase registration
  getItInstance.registerLazySingleton<GetTrending>(
      () => GetTrending(repositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<GetPopular>(
      () => GetPopular(repositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<GetCommingSoon>(
      () => GetCommingSoon(repositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(repositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<SearchMovies>(
      () => SearchMovies(repositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<SaveDataLocal>(
      () => SaveDataLocal(movieRepositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<DeleteDataLocally>(() =>
      DeleteDataLocally(movieRepositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(() =>
      CheckIfFavoriteMovie(movieRepositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<GetFavoriteMovies>(() =>
      GetFavoriteMovies(movieRepositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<GetDetailMovie>(
      () => GetDetailMovie(movieRepositary: getItInstance<MovieRepositary>()));
  getItInstance.registerLazySingleton<GetCastDetail>(
      () => GetCastDetail(repositary: getItInstance<MovieRepositary>()));

  //Registering cubit
  getItInstance.registerFactory(() => FavoriteCubit(
      saveMovie: getItInstance(),
      getFavoriteMovies: getItInstance(),
      deleteFavoriteMovie: getItInstance(),
      checkIfFavoriteMovie: getItInstance()));

  getItInstance.registerFactory(() => MovieCarouselCubit(getItInstance()));
  getItInstance.registerFactory(() => MovieTabCubit(
      getPopular: getItInstance(),
      getComingSoon: getItInstance(),
      getPlayingNow: getItInstance()));

  getItInstance
      .registerFactory(() => MovieDetailCubit(getMovieDetail: getItInstance()));
}

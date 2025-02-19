import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/dependecy_inject/get_it.dart';

import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_carousel/movie_carousel_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_cast/cast_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_tab_cubit/movie_tab_cubit.dart';
import 'package:movie_app/presentation/cubit/search/search_cubit.dart';
import 'package:movie_app/presentation/journey/home/home.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';
import 'package:movie_app/presentation/wiredash_app.dart/wiredash_app.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovieCarouselCubit(getItInstance())),
        BlocProvider(
            create: (context) => MovieTabCubit(
                getPopular: getItInstance(),
                getComingSoon: getItInstance(),
                getPlayingNow: getItInstance())),
        BlocProvider(
            create: (context) => FavoriteCubit(
                saveMovie: getItInstance(),
                getFavoriteMovies: getItInstance(),
                deleteFavoriteMovie: getItInstance(),
                checkIfFavoriteMovie: getItInstance())),
        BlocProvider(
            create: (context) =>
                SearchMovieCubit(searchMovies: getItInstance())),
        BlocProvider(
            create: (context) =>
                MovieDetailCubit(getMovieDetail: getItInstance())),
        BlocProvider(
            create: (context) => CastCubit(getCastDetail: getItInstance())),
        BlocProvider(
            create: (context) => FavoriteCubit(
                saveMovie: getItInstance(),
                getFavoriteMovies: getItInstance(),
                deleteFavoriteMovie: getItInstance(),
                checkIfFavoriteMovie: getItInstance())
              ..loadFavoriteMovies()),
      ],
      child: WiredashApp(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
            primaryColor: AppColor.vulcan,
            scaffoldBackgroundColor: AppColor.vulcan,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(elevation: 0),
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}

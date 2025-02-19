import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_cubit.dart';
import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_state.dart';
import 'package:movie_app/presentation/journey/favourite/favourite_movies_grid_view.dart';

class FavouriteScreenone extends StatefulWidget {
  const FavouriteScreenone({Key? key}) : super(key: key);

  @override
  State<FavouriteScreenone> createState() => _FavouriteScreenoneState();
}

class _FavouriteScreenoneState extends State<FavouriteScreenone> {
  late FavoriteCubit favoriteCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Movies"),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavoriteMoviesLoaded) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return const Center(
                child: Text("No Favourite movies"),
              );
            }
            return FavouriteMoviesGridView(movies: movies);
          } else {
            return const Center(
              child: Text("Unknown state"),
            );
          }
        },
      ),
    );
  }
}

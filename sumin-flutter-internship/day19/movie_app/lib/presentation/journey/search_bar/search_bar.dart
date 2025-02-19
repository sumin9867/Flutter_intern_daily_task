import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/cubit/search/search_cubit.dart';
import 'package:movie_app/presentation/cubit/search/search_state.dart';
import 'package:movie_app/presentation/journey/search_bar/search_card.dart';

class CustomSearchBar extends SearchDelegate {
  final SearchMovieCubit searchMovieCubit;

  CustomSearchBar({
    required this.searchMovieCubit,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty
            ? null
            : () {
                query = '';
              },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieCubit.searchMovieByTerm(query);
    return BlocBuilder<SearchMovieCubit, SearchMovieState>(
      builder: (context, state) {
        if (state is SearchMovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchMovieLoaded) {
          final movies = state.movies;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return SearchCard(movieEntity: movies[index]);
            },
          );
        } else if (state is SearchMovieError) {
          return const Center(
            child: Text(
              "error",
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}

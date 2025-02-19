import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/presentation_layer/cubit/search_query/search_query_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/search_query/search_query_state.dart';
import 'package:photo_labs/presentation_layer/screen/search_bar/search_card.dart';

class CustomSearchBar extends SearchDelegate {
  final SearchQueryCubit searchQueryCubit;

  CustomSearchBar({required this.searchQueryCubit});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
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
    searchQueryCubit.searchImages(query);
    return BlocBuilder<SearchQueryCubit, SearchQueryState>(
      builder: (context, state) {
        if (state is SearchQueryInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchQueryLoaded) {
          final movies = state.photos;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return SearchCard(
                photoListEntity: movies[index],
              );
            },
          );
        } else if (state is SearchQueryError) {
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

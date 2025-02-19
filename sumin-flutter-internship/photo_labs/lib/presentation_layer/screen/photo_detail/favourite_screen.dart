import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/presentation_layer/cubit/favourite_image/favourite_image_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/favourite_image/favourite_image_state.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Load favorites when the screen is first built
    context.read<FavouriteCubit>().loadFavorites();

    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        if (state is FavouriteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FavouriteLoaded) {
          return ListView.builder(
            itemCount: state.favourites.length,
            itemBuilder: (context, index) {
              final favourite = state.favourites[index];
              return ListTile(
                title: Text(favourite.description),
              );
            },
          );
        } else if (state is FavouriteError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text('Unknown state'),
          );
        }
      },
    );
  }
}

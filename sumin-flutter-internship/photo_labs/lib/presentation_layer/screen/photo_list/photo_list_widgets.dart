import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/presentation_layer/cubit/photo_list_cubit/photo_list_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/photo_list_cubit/photo_list_state.dart';
import 'package:photo_labs/presentation_layer/screen/photo_list/phoro_list_grid_view.dart';

class PhotoListWidget extends StatelessWidget {
  const PhotoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoListCubit, PhotoListState>(
      builder: (context, state) {
        if (state is PhotoListInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PhotoListLoaded) {
          return PhotoListGridView(
            photos: state.photos,
          );
        } else if (state is PhotoListError) {
          return const Center(
            child: Text('Failed to load photos'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

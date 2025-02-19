import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/presentation_layer/cubit/movie_carousel/random_image_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/movie_carousel/random_iamge_state.dart';
import 'package:photo_labs/presentation_layer/screen/random_image_screen/random_iamge_page_view.dart';

class RandomImageWidget extends StatelessWidget {
  const RandomImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoCarouselCubit, PhotoCarouselState>(
      builder: (context, state) {
        if (state is PhotoCarouselInitial) {
          context.read<PhotoCarouselCubit>().getImages(0);
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PhotoCarouselLoaded) {
          return RandomImagePageView(
            photo: state.photos,
          );
        } else if (state is PhotoCarouselError) {
          return const Text(
            "error",
            style: TextStyle(color: Colors.white, fontSize: 20),
          );
        }
        return Container();
      },
    );
  }
}

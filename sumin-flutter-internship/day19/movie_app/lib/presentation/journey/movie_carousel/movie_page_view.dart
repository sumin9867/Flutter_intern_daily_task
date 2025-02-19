import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/size_constant.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

import 'package:movie_app/presentation/journey/movie_carousel/animated_card_widgets.dart';

class MoviePageView extends StatelessWidget {
  final List<MovieEntity>? movies;

  const MoviePageView({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      child: PageView.builder(
        controller: pageController,
        itemCount: movies?.length ?? 0,
        itemBuilder: (context, index) {
          final movie = movies![index];
          return AnimatedMovieCardWidgets(
            movieId: movie.id,
            posterPath: movie.posterPath,
            index: index,
            pageController: pageController,
          );
        },
      ),
    );
  }
}

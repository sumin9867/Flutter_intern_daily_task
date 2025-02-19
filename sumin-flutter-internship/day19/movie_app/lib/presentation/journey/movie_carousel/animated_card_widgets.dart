import 'package:flutter/material.dart';
import 'package:movie_app/common/constant/size_constant.dart';
import 'package:movie_app/common/extension/size_extension.dart';

import 'package:movie_app/presentation/journey/movie_carousel/movie_card.dart';

class AnimatedMovieCardWidgets extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCardWidgets({
    Key? key,
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (BuildContext context, Widget? child) {
          double? value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page! - index;
            value = (1 - (value.abs())).clamp(0.0, 1.0);
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: Curves.easeIn.transform(value) *
                    MediaQuery.of(context).size.height *
                    .4,
                width: Sizes.dimen_230.w,
                child: child,
              ),
            );
          } else {
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height:
                    Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                        MediaQuery.of(context).size.height *
                        .4,
                width: Sizes.dimen_230.w,
                child: child,
              ),
            );
          }
        },
        child: MovieCardWidgets(
          movieId: movieId,
          posterPath: posterPath,
        ));
  }
}

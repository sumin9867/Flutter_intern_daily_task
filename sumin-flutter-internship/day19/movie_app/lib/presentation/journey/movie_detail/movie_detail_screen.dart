import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/dependecy_inject/get_it.dart';
import 'package:movie_app/presentation/cubit/movie_cast/cast_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_cast/cast_state.dart';
import 'package:movie_app/presentation/cubit/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_detail_cubit/movie_detail_state.dart';
import 'package:movie_app/presentation/journey/movie_detail/cast_widgets/cast_widgets.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_Detail_arguement/movie_detail_argument.dart';
import 'package:movie_app/presentation/journey/movie_detail/big_poster.dart';
import 'package:movie_app/presentation/theme/screen_size.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({Key? key, required this.movieDetailArguments})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailCubit _movieDetailCubit;
  @override
  void initState() {
    super.initState();

    _movieDetailCubit = MovieDetailCubit(getMovieDetail: getItInstance());
    _movieDetailCubit.fetchMovieDetail(widget.movieDetailArguments.movieId);

    context
        .read<CastCubit>()
        .fetchCastDetail(widget.movieDetailArguments.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _movieDetailCubit,
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailModel;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(movie: movieDetail),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.getScreenWidth(context) * .04),
                      child:
                          Text(movieDetail.overview, style: NormalText.style),
                    ),
                    SizedBox(height: ScreenSize.getScreenHeight(context) * .02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.getScreenWidth(context) * .05,
                          vertical: ScreenSize.getScreenHeight(context) * .01),
                      child: const Text(
                        "Cast",
                        style: HeadlineText.style,
                      ),
                    ),
                    BlocBuilder<CastCubit, CastState>(
                      builder: (context, castState) {
                        log("Cast state $castState");
                        if (castState is CastLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (castState is CastLoaded) {
                          return CastList(casts: castState.casts);
                        } else if (castState is CastError) {
                          return const Center(
                              child: Text(
                            'Failed to load cast',
                            style: Body2.style,
                          ));
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

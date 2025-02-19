import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/cubit/movie_carousel/movie_carousel_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_carousel/movie_carousel_state.dart';
import 'package:movie_app/presentation/journey/drawer/navigation_drawer.dart';
import 'package:movie_app/presentation/journey/movie_carousel/movie_carousel_widgets.dart';
import 'package:movie_app/presentation/journey/movie_tabbed.dart/movie_tab_widgets.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';
import 'package:movie_app/presentation/widgets/appbar_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustopmNavigationDrawer(),
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselInitial) {
              BlocProvider.of<MovieCarouselCubit>(context).getMovie(0);
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieCarouselLoaded) {
              return Column(
                children: [
                  const Expanded(
                    child: MovieAppBar(),
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      child: MovieCarouselWidget(
                        movies: state.movies,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 4,
                    child: MovieTabWidgets(),
                  ),
                ],
              );
            } else if (state is MovieCarouselError) {
              return const Center(
                child: Text(
                  'Failed to fetch movies',
                  style: HeadlineDetail.style,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

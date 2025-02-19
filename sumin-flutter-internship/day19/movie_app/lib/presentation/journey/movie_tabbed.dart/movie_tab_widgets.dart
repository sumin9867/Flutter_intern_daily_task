import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/cubit/movie_tab_cubit/movie_tab_cubit.dart';
import 'package:movie_app/presentation/cubit/movie_tab_cubit/movie_tab_state.dart';
import 'package:movie_app/presentation/journey/movie_tabbed.dart/movie_listview_builder.dart';
import 'package:movie_app/presentation/journey/movie_tabbed.dart/movie_tab_constance.dart';
import 'package:movie_app/presentation/journey/movie_tabbed.dart/movie_tab_titlle_widget.dart';

class MovieTabWidgets extends StatefulWidget {
  const MovieTabWidgets({Key? key}) : super(key: key);

  @override
  State<MovieTabWidgets> createState() => _MovieTabWidgetsState();
}

class _MovieTabWidgetsState extends State<MovieTabWidgets>
    with SingleTickerProviderStateMixin {
  late MovieTabCubit movieTabCubit;

  @override
  void initState() {
    super.initState();
    movieTabCubit = context.read<MovieTabCubit>();
    movieTabCubit.getTabChanged(1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabCubit, MovieTabState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < MovieTabConstance.movietabs.length; i++)
                    TabTitleWidget(
                      title: MovieTabConstance.movietabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabConstance.movietabs[i].index ==
                          state.currentTabIndex,
                    ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (state is MovieTabChanged)
                Expanded(
                  child: MovieListViewBuilder(
                    movies: state.movies,
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  _onTabTapped(int i) {
    movieTabCubit.getTabChanged(i);
  }
}

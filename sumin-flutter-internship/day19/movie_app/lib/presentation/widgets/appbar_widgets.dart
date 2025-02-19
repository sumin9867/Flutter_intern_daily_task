import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constant/size_constant.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/presentation/cubit/search/search_cubit.dart';
import 'package:movie_app/presentation/cubit/search/search_state.dart';
import 'package:movie_app/presentation/journey/search_bar/search_bar.dart';
import 'package:movie_app/presentation/widgets/logo_widgets.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMovieCubit, SearchMovieState>(
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: Sizes.dimen_20.h,
                color: Colors.white,
              ),
            ),
            const Expanded(
              child: LogoWidgets(
                height: Sizes.dimen_32,
              ),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchBar(
                    searchMovieCubit:
                        BlocProvider.of<SearchMovieCubit>(context),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: Sizes.dimen_20.h,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}

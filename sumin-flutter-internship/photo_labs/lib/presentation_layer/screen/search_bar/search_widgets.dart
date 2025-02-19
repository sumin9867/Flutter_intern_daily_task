import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/presentation_layer/cubit/search_query/search_query_cubit.dart';
import 'package:photo_labs/presentation_layer/screen/search_bar/search_bar.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: CustomSearchBar(
            searchQueryCubit: context.read<SearchQueryCubit>(),
          ),
        );
      },
      child: Container(
        width: ScreenSize.getScreenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color.fromARGB(255, 223, 222, 222)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: ScreenSize.getScreenWidth(context) * .05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

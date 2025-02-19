import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/data_layer/core/app_routers/app_routes.dart';
import 'package:photo_labs/dependency_injection.dart/get_it.dart';
import 'package:photo_labs/domain_layer/domain_repositary/favourite_repositary.dart';
import 'package:photo_labs/presentation_layer/cubit/favourite_image/favourite_image_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/search_query/search_query_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/movie_carousel/random_image_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/photo_detail_cubit/photo_detail_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/photo_list_cubit/photo_list_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/topic_list/topic_list_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/topic_list_view/topic_list_view_cubit.dart';
import 'package:photo_labs/presentation_layer/screen/splash_screen.dart/splash_widgets.dart';

class PhotoLabApp extends StatelessWidget {
  const PhotoLabApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoListCubit = PhotoListCubit(getItInstance());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => photoListCubit..getPhotoList(),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(repository: FavouriteRepository())
            ..loadFavorites(),
        ),
        BlocProvider(
          create: (context) => PhotoDetailCubit(getItInstance()),
        ),
        BlocProvider(
          create: (context) =>
              PhotoCarouselCubit(getItInstance())..getRandomImages,
        ),
        BlocProvider(
            create: (context) =>
                SearchQueryCubit(searchPhoto: getItInstance())),
        BlocProvider(
            create: (context) =>
                TopicListCubit(getItInstance())..getTopiclist()),
        BlocProvider(
          create: (context) => TopicListViewCubit(getItInstance()),
        ),
        BlocProvider(
          create: (context) =>
              FavouriteCubit(repository: FavouriteRepository()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.goRouter,

        // home: SplashWidgets(),
      ),
    );
  }
}

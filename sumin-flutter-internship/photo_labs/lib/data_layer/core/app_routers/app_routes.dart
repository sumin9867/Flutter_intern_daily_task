import 'package:go_router/go_router.dart';
import 'package:photo_labs/presentation_layer/screen/photo_detail/movie_detail_argument.dart';
import 'package:photo_labs/presentation_layer/screen/photo_detail/photo_detail_widgets.dart';
import 'package:photo_labs/presentation_layer/screen/photo_list/photo_list_widgets.dart';
import 'package:photo_labs/presentation_layer/screen/random_image_screen/random_image_widgets.dart';
import 'package:photo_labs/presentation_layer/screen/search_bar/search_widgets.dart';
import 'package:photo_labs/presentation_layer/screen/splash_screen.dart/splash_widgets.dart';
import 'package:photo_labs/presentation_layer/screen/topic_list/topic_list_widget.dart';
import 'package:photo_labs/presentation_layer/screen/topic_listview/photo_list_widgets.dart';
import 'package:photo_labs/presentation_layer/widgets/navigation_screen.dart';
// Adjust the import

class AppRoutes {
  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'splashscreen',
        builder: (context, state) => const SplashWidgets(),
      ),
      GoRoute(
        path: '/photolist',
        name: 'photolist',
        builder: (context, state) => const PhotoListWidget(),
      ),
      GoRoute(
        path: '/randomimage',
        name: 'randomimage',
        builder: (context, state) => const RandomImageWidget(),
      ),
      GoRoute(
        path: '/SearchContainer',
        name: 'SearchContainer',
        builder: (context, state) => const SearchContainer(),
      ),
      GoRoute(
        path: '/bottomnavigation',
        name: 'bottomnavigation',
        builder: (context, state) => const AppNAvigationaBar(),
      ),
      GoRoute(
        path: '/topicListWidgets',
        name: 'topicListWidgets',
        builder: (context, state) => const TopicListWidgets(),
      ),
      GoRoute(
        path: '/photodetail/:id',
        name: 'photodetail',
        builder: (context, state) {
          final String photoId = state.pathParameters['id']!;
          return PhotoDetailScreen(
            photoDetailArguments: PhotoDetailArguments(photoId: photoId),
          );
        },
      ),
      GoRoute(
        path: '/topicListViewScreen/:id',
        name: 'topicListViewScreen',
        builder: (context, state) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>? ?? {};
          final String id = extra["id"] ?? '';
          final String title = extra["title"] ?? '';

          return TopicListViewScreen(
            id: id,
            title: title,
          );
        },
      ),
    ],
  );
}

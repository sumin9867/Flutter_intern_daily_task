// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/data/core/api_constant.dart';
// import 'package:movie_app/domain/entities/movie_detail_entity.dart';
// import 'package:movie_app/presentation/cubit/movie_detail_cubit/movie_detail_cubit.dart';
// import 'package:movie_app/presentation/shared_preference.dart';
// import 'package:movie_app/presentation/theme/screen_size.dart';

// class FavoriteMoviesPage extends StatelessWidget {
//   const FavoriteMoviesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<MovieDetailEntity>>(
//         future: SharedPreferencesHelper.getFavoriteMovies(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final List<MovieDetailEntity>? favoriteMovies = snapshot.data;
//             if (favoriteMovies == null || favoriteMovies.isEmpty) {
//               return const Center(child: Text('No favorite movies found'));
//             } else {
//               return ListView.builder(
//                 itemCount: favoriteMovies.length,
//                 itemBuilder: (context, index) {
//                   final movie = favoriteMovies[index];
//                   return MovieCard(movie: movie);
//                 },
//               );
//             }
//           }
//         },
//       ),
//     );
//   }
// }

// class MovieCard extends StatelessWidget {
//   final MovieDetailEntity movie;

//   const MovieCard({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(8),
//         leading: ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: CachedNetworkImage(
//             imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
//             width: ScreenSize.getScreenWidth(context) * 0.3,
//             height: ScreenSize.getScreenHeight(context) * .5,
//             placeholder: (context, url) => const CircularProgressIndicator(),
//             errorWidget: (context, url, error) => const Icon(Icons.error),
//           ),
//         ),
//         title: Text(
//           movie.title,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         subtitle: Text(
//           'Release Date: ${movie.releaseData}',
//           style: const TextStyle(
//             fontSize: 14,
//           ),
//         ),
//         trailing: IconButton(
//           onPressed: () {
//             // Call the removeFavourite method from MovieDetailCubit
//             context.read<MovieDetailCubit>().removeFavourite(movie);
//           },
//           icon: const Icon(Icons.cancel_outlined),
//         ),
//       ),
//     );
//   }
// }

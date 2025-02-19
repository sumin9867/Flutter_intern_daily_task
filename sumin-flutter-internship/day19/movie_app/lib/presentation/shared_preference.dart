// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:movie_app/domain/entities/movie_detail_entity.dart';

// class SharedPreferencesHelper {
//   static Future<void> saveMovieToFavorites(MovieDetailEntity movie) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('movie_${movie.id}', json.encode(movie.toJson()));
//   }

//   static Future<List<MovieDetailEntity>> getFavoriteMovies() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<MovieDetailEntity> favoriteMovies = [];

//     Set<String> keys = prefs.getKeys();

//     for (var key in keys) {
//       if (key.startsWith('movie_')) {
//         String? movieJson = prefs.getString(key);
//         if (movieJson != null) {
//           MovieDetailEntity movie =
//               MovieDetailEntity.fromJson(json.decode(movieJson));
//           favoriteMovies.add(movie);
//         }
//       }
//     }

//     return favoriteMovies;
//   }

//   static Future<void> removeMovieFromFavorites(MovieDetailEntity movie) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('movie_${movie.id}');
//   }
// }

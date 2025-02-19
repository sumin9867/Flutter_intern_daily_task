import 'package:hive/hive.dart';
import 'package:movie_app/common/tables/movie_tables.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovies(MovieTable movieTable);
  Future<List<MovieEntity>> getMovies();
  Future<void> deleteMovies(int id);
  Future<bool> checkifMoviesFavourite(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkifMoviesFavourite(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovies(int id) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.delete(id);
  }

  @override
  Future<List<MovieEntity>> getMovies() async {
    final movieBox = await Hive.openBox('movieBox');
    final movieIds = movieBox.keys;
    List<MovieTable> movies = [];
    for (var movieId in movieIds) {
      movies.add(movieBox.get(movieId));
    }
    return movies;
  }

  @override
  Future<void> saveMovies(MovieTable movieTable) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.put(movieTable.id, movieTable);
  }
}

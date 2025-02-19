// ignore_for_file: overridden_fields

import 'package:hive/hive.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
part 'movie_tables.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @override
  @HiveField(0)
  final int id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final String posterPath;

  const MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
  }) : super(
            posterPath: posterPath,
            backdropPath: '',
            title: title,
            releaseData: '',
            overview: '',
            id: id,
            voteAverage: 0);

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
    );
  }
}

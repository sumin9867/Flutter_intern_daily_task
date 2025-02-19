import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final String backdropPath;
  final String title;
  final String releaseData;
  final String overview;
  final int id;
  final num voteAverage;

  const MovieEntity(
      {required this.posterPath,
      required this.backdropPath,
      required this.title,
      required this.releaseData,
      required this.overview,
      required this.id,
      required this.voteAverage});

  @override
  List<Object?> get props => [id, title];

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
        posterPath: movieDetailEntity.posterPath,
        backdropPath: movieDetailEntity.backdropPath,
        title: movieDetailEntity.title,
        releaseData: movieDetailEntity.releaseData,
        overview: movieDetailEntity.overview,
        id: movieDetailEntity.id,
        voteAverage: movieDetailEntity.voteAverage);
  }
}

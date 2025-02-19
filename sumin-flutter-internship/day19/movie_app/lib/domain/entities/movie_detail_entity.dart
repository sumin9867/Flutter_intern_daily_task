import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final String posterPath;
  final String backdropPath;
  final String title;
  final String releaseData;
  final String overview;
  final int id;
  final num voteAverage;

  const MovieDetailEntity(
      {required this.posterPath,
      required this.backdropPath,
      required this.title,
      required this.releaseData,
      required this.overview,
      required this.id,
      required this.voteAverage});
  Map<String, dynamic> toJson() {
    return {
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'title': title,
      'release_date': releaseData,
      'overview': overview,
      'id': id,
      'vote_average': voteAverage,
    };
  }

  factory MovieDetailEntity.fromJson(Map<String, dynamic> json) {
    return MovieDetailEntity(
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      releaseData: json['release_date'],
      overview: json['overview'],
      id: json['id'],
      voteAverage: json['vote_average'],
    );
  }

  @override
  List<Object?> get props =>
      [id, posterPath, backdropPath, title, releaseData, overview, voteAverage];
}

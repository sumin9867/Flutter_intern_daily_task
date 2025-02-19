// ignore_for_file: overridden_fields

import 'package:movie_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  @override
  final String backdropPath;
  @override
  final int id;
  @override
  final String title;
  final String? originalLanguage;
  final String? originalTitle;
  @override
  final String overview;
  @override
  final String posterPath;
  final List<int>? genreIds;
  final double? popularity;
  final String releaseDate;
  final bool video;
  @override
  final double voteAverage;
  final int? voteCount;

  const MovieModel(
      {this.adult,
      required this.backdropPath,
      required this.id,
      required this.title,
      this.originalLanguage,
      this.originalTitle,
      required this.overview,
      required this.posterPath,
      this.genreIds,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      this.voteCount})
      : super(
            id: id,
            backdropPath: backdropPath,
            overview: overview,
            posterPath: posterPath,
            releaseData: releaseDate,
            title: title,
            voteAverage: voteAverage);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult:
          json['adult'] ?? false, // Provide a default value if 'adult' is null
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0, // Provide a default value if 'id' is null
      title: json['title'] ?? '',
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      genreIds:
          json['genre_ids'] != null ? List<int>.from(json['genre_ids']) : [],
      popularity: json['popularity'] ??
          0.0, // Provide a default value if 'popularity' is null
      releaseDate: json['release_date'] ?? '',
      video:
          json['video'] ?? false, // Provide a default value if 'video' is null
      voteAverage: json['vote_average'] ??
          0.0, // Provide a default value if 'vote_average' is null
      voteCount: json['vote_count'] ??
          0, // Provide a default value if 'vote_count' is null
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;

    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

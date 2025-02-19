import 'package:movie_app/data/models/movie_model.dart';

class MovieResultModel {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MovieResultModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  MovieResultModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieModel>[];
      json['results'].forEach((v) {
        results!.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

import 'package:movie_app/data/models/movie_cast_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendings();
  Future<List<MovieModel>> getpopular();
  Future<List<MovieModel>> getCommingSoon();
  Future<List<MovieModel>> getSearchdata(String searchTerm);

  Future<List<MovieModel>> getPlayingNow();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getCastDetail(int id);
}

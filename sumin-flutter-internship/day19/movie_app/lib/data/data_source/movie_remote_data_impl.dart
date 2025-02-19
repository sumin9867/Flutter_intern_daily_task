import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/models/movie_cast_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_result.dart';
import 'package:movie_app/data/repositary/movie_remote_data.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrendings() async {
    final response = await _client.get("trending/movie/day");
    final movieresult = MovieResultModel.fromJson(response);
    final List<MovieModel> movie = movieresult.results!;
    return movie;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async {
    final response = await _client.get("movie/upcoming");
    final movieresult = MovieResultModel.fromJson(response);
    final List<MovieModel> movie = movieresult.results!;

    return movie;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get("movie/now_playing");
    final movieresult = MovieResultModel.fromJson(response);
    final List<MovieModel> movie = movieresult.results!;
    return movie;
  }

  @override
  Future<List<MovieModel>> getpopular() async {
    final response = await _client.get("movie/popular");
    final movieresult = MovieResultModel.fromJson(response);
    final List<MovieModel> movie = movieresult.results!;
    return movie;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');

    final MovieDetailModel movieDetail = MovieDetailModel.fromJson(response);

    return movieDetail;
  }

  @override
  Future<List<CastModel>> getCastDetail(int id) async {
    final response = await _client.get('movie/$id/credits', params: {});

    final castCrewResult = CastCrewResultModel.fromJson(response);
    final List<CastModel> castDetail = castCrewResult.cast;

    return castDetail;
  }

  @override
  Future<List<MovieModel>> getSearchdata(String searchTerm) async {
    final response =
        await _client.get("search/movie", params: {'query': searchTerm});
    final movieresult = MovieResultModel.fromJson(response);
    final List<MovieModel> movie = movieresult.results!;
    return movie;
  }
}

// https://api.themoviedb.org/3/movie/1/credits?api_key=f33521953035af3fc3162fe1ac22e60c
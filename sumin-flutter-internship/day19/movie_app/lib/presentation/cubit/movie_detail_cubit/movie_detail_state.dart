// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object?> get props => [];
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetailModel;

  const MovieDetailLoaded({required this.movieDetailModel});

  @override
  List<Object?> get props => [movieDetailModel];
}

class MovieDetailError extends MovieDetailState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class MovieFavouriteRemoved extends MovieDetailState {
  int movieid;
  MovieFavouriteRemoved({
    required this.movieid,
  });

  @override
  List<Object?> get props => [movieid];
}

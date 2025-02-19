import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {
  final List<MovieEntity> movies;

  const SearchMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieError extends SearchMovieState {
  @override
  List<Object> get props => [];
}

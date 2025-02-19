import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieCarouselState {
  final int index;

  const MovieCarouselState(this.index);
}

class MovieCarouselInitial extends MovieCarouselState {
  const MovieCarouselInitial() : super(0);
  List<Object?> get props => [];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;
  MovieCarouselLoaded(
    super.key, {
    required this.movies,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'Defailt index cannot be less than 0');

  List<Object?> get props => [movies, index];
}

class MovieCarouselError extends MovieCarouselState {
  const MovieCarouselError() : super(0);

  List<Object?> get props => [];
}

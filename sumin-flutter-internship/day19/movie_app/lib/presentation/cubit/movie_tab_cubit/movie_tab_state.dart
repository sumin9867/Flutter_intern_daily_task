import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieTabState extends Equatable {
  final int? currentTabIndex;

  const MovieTabState({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex!];
}

class MovieTabInitial extends MovieTabState {}

class MovieTabChanged extends MovieTabState {
  final List<MovieEntity> movies;

  const MovieTabChanged({int? currentTabIndex, required this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex!, movies];
}

class MovieTabError extends MovieTabState {
  const MovieTabError({int? currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}

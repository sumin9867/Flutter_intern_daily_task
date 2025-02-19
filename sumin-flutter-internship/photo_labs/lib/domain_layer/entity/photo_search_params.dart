import 'package:equatable/equatable.dart';

class MovieSearchParams extends Equatable {
  final String query;

  const MovieSearchParams(this.query);

  @override
  List<Object> get props => [query];
}

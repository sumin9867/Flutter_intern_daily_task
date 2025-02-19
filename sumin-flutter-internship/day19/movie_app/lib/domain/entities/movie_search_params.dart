import 'package:equatable/equatable.dart';

class MovieSearchParams extends Equatable {
  final String searchTerms;

  const MovieSearchParams(this.searchTerms);

  @override
  List<Object> get props => [searchTerms];
}

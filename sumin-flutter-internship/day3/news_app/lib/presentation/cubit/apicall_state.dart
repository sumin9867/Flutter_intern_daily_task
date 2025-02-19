import 'package:news_app/domain/entity/news_model.dart';

abstract class ApiCallState {}

class InitializedApiCall extends ApiCallState {}

class LoadingDataFetching extends ApiCallState {}

class ResponseDataFetching extends ApiCallState {
  final List<NewsArticle> newsArticle;

  ResponseDataFetching({required this.newsArticle});
}

class ErrorDataFetching extends ApiCallState {
  final String errorMessage;

  ErrorDataFetching({required this.errorMessage});
}

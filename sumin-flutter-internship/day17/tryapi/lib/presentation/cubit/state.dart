import 'package:tryapi/domain/enitites/apimodel.dart';

abstract class MyState {}

class InitialState extends MyState {}

class LoadingState extends MyState {}

class LoadedState extends MyState {
  List<ApiModel> data;
  LoadedState({
    required this.data,
  });
}

class ErrorState extends MyState {
  String error;
  ErrorState({
    required this.error,
  });
}

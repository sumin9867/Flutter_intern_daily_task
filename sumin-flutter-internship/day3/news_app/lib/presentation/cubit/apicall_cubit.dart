import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/data_source/news_api.dart';
import 'package:news_app/presentation/cubit/apicall_state.dart';

class ApiCallCubit extends Cubit<ApiCallState> {
  ApiCallCubit() : super(InitializedApiCall());

  getDataCubit() async {
    emit(LoadingDataFetching());
    try {
      final result = await NewsApi.fetchNews();
      emit(ResponseDataFetching(newsArticle: result));
    } catch (e) {
      emit(ErrorDataFetching(errorMessage: 'Error Fetching Data'));
    }
  }
}

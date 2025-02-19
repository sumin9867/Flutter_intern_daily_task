// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tryapi/domain/usecase/get_data.dart';
// import 'package:tryapi/presentation/cubit/state.dart';

// class ApiCubit extends Cubit<MyState> {
//   final GetData getData;

//   ApiCubit(this.getData) : super(InitialState());

//   Future<void> getdata() async {
//     emit(LoadingState());
//     try {
//       final resultfromapi = await getData.call();

//       print(resultfromapi);

//       emit(LoadedState(data: resultfromapi));
//     } catch (e) {
//       emit(ErrorState(error: e.toString()));
//     }
//   }
// }
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryapi/domain/usecase/get_data.dart';
import 'package:tryapi/presentation/cubit/state.dart';

class ApiCubit extends Cubit<MyState> {
  GetData getDataUseCase;
  ApiCubit(
    this.getDataUseCase,
  ) : super(InitialState());

  Future<void> getdata() async {
    emit(LoadingState());
    try {
      final resultfromapi = await getDataUseCase.call();

      log("Data is ${resultfromapi.toString()}");
      emit(LoadedState(data: resultfromapi));
    } catch (e) {
      log("Error =========== $e");
      emit(ErrorState(error: e.toString()));
    }
  }
}

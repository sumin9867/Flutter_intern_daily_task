import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/use_cases/get_castdetail.dart';
import 'package:movie_app/presentation/cubit/movie_cast/cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final GetCastDetail getCastDetail;

  CastCubit({
    required this.getCastDetail,
  }) : super(CastInitial());

  Future<void> fetchCastDetail(int id) async {
    emit(CastLoading());
    final Either<AppError, List<CastEntity>> eitherResponse =
        await getCastDetail(MovieParams(id));
    eitherResponse.fold(
      (l) {
        emit(CastError(message: l.message));
      },
      (r) {
        emit(CastLoaded(casts: r));
      },
    );
  }
}

import 'package:dartz/dartz.dart';

import 'package:photo_labs/domain_layer/entity/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

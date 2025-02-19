import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';

abstract class CastState extends Equatable {}

class CastInitial extends CastState {
  @override
  List<Object?> get props => [];
}

class CastLoading extends CastState {
  @override
  List<Object?> get props => [];
}

class CastLoaded extends CastState {
  final List<CastEntity> casts;

  CastLoaded({required this.casts});
  @override
  List<Object?> get props => [];
}

class CastError extends CastState {
  final String message;

  CastError({required this.message});
  @override
  List<Object?> get props => [];
}

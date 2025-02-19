import 'package:equatable/equatable.dart';

class PhotoParams extends Equatable {
  final String id;

  const PhotoParams(this.id);

  @override
  List<Object> get props => [id];
}

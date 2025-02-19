import 'package:equatable/equatable.dart';

class ApiModel extends Equatable {
  final String title;
  final String? description;
  final String? thumbnail;

  const ApiModel({
    required this.title,
    this.description,
    this.thumbnail,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        thumbnail,
      ];
}

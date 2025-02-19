import 'package:equatable/equatable.dart';

class TopicListEntity extends Equatable {
  final String id;
  final String slug;
  final String title;
  // final CoverPhoto coverPhoto;

  const TopicListEntity({
    required this.id,
    required this.slug,
    required this.title,
  });

  @override
  List<Object?> get props => [id, slug, title];
}

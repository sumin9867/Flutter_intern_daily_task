import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String subject;
  final String title;

  NoteModel({required this.subject, required this.title});

  @override
  List<Object?> get props => [subject, title];
}

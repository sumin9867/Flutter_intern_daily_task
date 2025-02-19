import 'package:equatable/equatable.dart';
import 'package:learning_cubit/note_model.dart';

abstract class NoteCubitState extends Equatable {
  const NoteCubitState();

  @override
  List<Object?> get props => [];
}

class NoteCubitInitial extends NoteCubitState {}

class NoteCubitLoaded extends NoteCubitState {
  final List<NoteModel> notes;

  NoteCubitLoaded({required this.notes});

  @override
  List<Object?> get props => [notes];
}

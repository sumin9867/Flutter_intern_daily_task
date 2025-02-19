import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learning_cubit/note_model.dart';

class NoteCubit extends Cubit<List<NoteModel>> {
  NoteCubit() : super([]);

  void addNote({
    required String subject,
    required String title,
  }) {
    final newNote = NoteModel(subject: subject, title: title);
    emit([...state, newNote]);
  }
}

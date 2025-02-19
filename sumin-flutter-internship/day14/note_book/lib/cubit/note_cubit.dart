import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book/note_model.dart';
import 'package:note_book/shareprefernce/notememory.dart';

class NoteCubit extends Cubit<List<NoteModel>> {
  NoteCubit() : super([]);

  Future<void> addNotes(NoteModel note) async {
    final List<NoteModel> newnote = [...state, note];
    emit(newnote);
    await saveDataToSharedPreferences(newnote);
  }

  Future<void> saveDataToSharedPreferences(List<NoteModel> notes) async {
    await NoteMemory().saveData(notes);
    emit((notes));
  }

  Future<void> loadDataFromSharedPreferences() async {
    List<NoteModel> notes = await NoteMemory.loaddata();
    emit((notes));
  }

  Future<void> editNote(int index, NoteModel updatedNote) async {
    List<NoteModel> notes = await NoteMemory.loaddata();
    notes[index] = updatedNote;
    emit(notes);
    await saveDataToSharedPreferences(notes);
  }

  Future<void> remove(int index) async {
    List<NoteModel> notes = await NoteMemory.loaddata();
    notes.removeAt(index);
    await saveDataToSharedPreferences(notes);
  }
}
